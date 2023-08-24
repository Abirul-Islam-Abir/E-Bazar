import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/model/slider_image_model.dart';

Future getSliderImageRequestApi({path, list}) async {
  final firestore = FirebaseFirestore.instance;
  final collection = await firestore.collection(path).get();
  for (var i = 0; i < collection.docs.length; i++) {
    list.add(SliderImageModel(img: collection.docs[i]['img']));
  }
}
