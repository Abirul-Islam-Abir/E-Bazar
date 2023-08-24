import '../utils/export.dart';

Future getSliderImageRequestApi({path, list}) async {
  final firestore = FirebaseFirestore.instance;
  final collection = await firestore.collection(path).get();
  for (var i = 0; i < collection.docs.length; i++) {
    list.add(SliderImageModel(img: collection.docs[i]['img']));
  }
}
