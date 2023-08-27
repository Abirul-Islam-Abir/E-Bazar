import '../utils/export.dart';

Future<void> getOnboardingImageRequestApi(
    {required String path, required List<OnBoardingImageModel> list}) async {
  try {
    final firestore = FirebaseFirestore.instance;
    final collection = await firestore.collection(path).get();

    for (var doc in collection.docs) {
      list.add(
        OnBoardingImageModel(
          img: doc['img'],
          title: doc['title'],
          subtitle: doc['subtitle'],
        ),
      );
    }

    // Optionally, print the list of onboarding images
    print(list);
  } catch (e) {
    print('Error fetching onboarding images: $e');
  }
}
