import '../utils/export.dart';

Future<void> getProductRequestApi(
    {required String path, required List<ProductModel> list}) async {
  try {
    final firestore = FirebaseFirestore.instance;
    final collection = await firestore.collection(path).get();

    for (var doc in collection.docs) {
      list.add(
        ProductModel(
          desc: doc['desc'],
          id: doc['id'],
          img: doc['img'],
          price: doc['price'],
          name: doc['name'],
        ),
      );
    }

    // Optionally, print the list of products
    print(list);
  } catch (e) {
    print('Error fetching product data: $e');
  }
}
