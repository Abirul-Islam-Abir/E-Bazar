import '../utils/export.dart';

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
