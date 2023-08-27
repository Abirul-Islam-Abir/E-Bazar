import '../utils/export.dart';

Future<void> getSliderImageRequestApi(
    {required String path, required List<SliderImageModel> list}) async {
  try {
    final firestore = FirebaseFirestore.instance;
    final collection = await firestore.collection(path).get();

    for (var doc in collection.docs) {
      list.add(SliderImageModel(
        img: doc['img'],
      ));
    }

    // Optionally, print the list of slider images
    print(list);
  } catch (e) {
    print('Error fetching slider images: $e');
  }
}
