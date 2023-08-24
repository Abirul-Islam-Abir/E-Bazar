import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/model/product_model.dart';

Future getProductRequestApi({path, list}) async {
  final firestore = FirebaseFirestore.instance;
  final collection = await firestore.collection(path).get();
  for (var i = 0; i < collection.docs.length; i++) {
    list.add(
      ProductModel(
          desc: collection.docs[i]['desc'],
          id: collection.docs[i]['id'],
          img: collection.docs[i]['img'],
          price: collection.docs[i]['price'],
          name: collection.docs[i]['name']),
    );
  }
}
