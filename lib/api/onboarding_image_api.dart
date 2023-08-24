import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/model/onboarding_image_model.dart';

Future getOnboardingImageRequestApi({path, list}) async {
  final firestore = FirebaseFirestore.instance;
  final collection = await firestore.collection(path).get();
  for (var i = 0; i < collection.docs.length; i++) {
    list.add(
      OnBoardingImageModel(
          img: collection.docs[i]['img'],
          title: collection.docs[i]['title'],
          subtitle: collection.docs[i]['subtitle']),
    );
  }
}
