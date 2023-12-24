import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../utils/export.dart';
import 'package:location/location.dart';

import 'package:flutter/services.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<Marker> markers = [];
  final List<LatLng> polylinePoints = [];
  GoogleMapController? mapController;
  final Location location = Location();
  LatLng? userLocation;
  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17.4746,
  );
  Future<void> getCurrentLocation() async {
    try {
      final PermissionStatus permissionStatus =
          await location.requestPermission();
      if (permissionStatus == PermissionStatus.granted) {
        onLocationChanged();
        updateLocation();
        setState(() {});
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        getCurrentLocation();
      }
    }
  }

  Future<void> updateLocation() async {
    final GoogleMapController controller = await _controller.future;
    if (userLocation != null) {
      setState(() {
        polylinePoints.clear();
      });
      addMarkerPosition();
      await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(userLocation!.latitude, userLocation!.longitude),
          tilt: 59.440717697143555,
          zoom: 17.00,
        ),
      ));
    }
  }

  // Function to add markers
  void addMarkerPosition() {
    markers.clear();
    final MarkerId markerId = MarkerId('markerId');
    Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(userLocation?.latitude ?? 0, userLocation?.longitude ?? 0),
      infoWindow: InfoWindow(
          title: 'My Current Location!',
          snippet:
              'Lat:${userLocation!.latitude},Lng:${userLocation!.longitude}'),
    );
    markers.add(marker);
    setState(() {});
  }

  // Function to change the map type
  void onMapTypeChanged(MapType newMapType) {
    setState(() {
      currentMapType = newMapType;
    });
  }

  void onLocationChanged() {
    location.onLocationChanged.listen((position) {
      userLocation = LatLng(position.latitude!, position.longitude!);
      polylinePoints.add(userLocation!);
      addMarkerPosition();
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColor.kTransparentColor,
          title: const Text('Google Map'),
          actions: [
            // Add PopupMenuButton to change map type
            PopupMenuButton<MapType>(
              onSelected: onMapTypeChanged,
              itemBuilder: (BuildContext context) {
                return availableMapTypes.map((MapType mapType) {
                  return PopupMenuItem<MapType>(
                    value: mapType,
                    child: Text(mapType.toString().split('.').last),
                  );
                }).toList();
              },
            ),
            // Search for places
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final String? result = await showSearch<String>(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
                if (result != null && result.isNotEmpty) {}
              },
            ),
          ],
        ),
        body: GoogleMap(
          mapType: currentMapType,
          polylines: {
            Polyline(
              polylineId: PolylineId("tracking"),
              color: Colors.blue,
              points: polylinePoints,
              width: 5,
            )
          },
          markers: Set<Marker>.of(markers),
          initialCameraPosition: cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: getCurrentLocation,
          child: const Icon(Icons.location_on),
        ),
      ),
    );
  }

  MapType currentMapType = MapType.normal;
  List<MapType> availableMapTypes = [
    MapType.normal,
    MapType.satellite,
    MapType.hybrid,
    MapType.terrain,
  ];
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Searching for $query...'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can add suggestions here if needed
    return SizedBox.shrink();
  }
}
