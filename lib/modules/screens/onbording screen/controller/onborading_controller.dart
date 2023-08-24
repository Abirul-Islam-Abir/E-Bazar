import '../../../../utils/export.dart';

class OnboardingScreenController extends GetxController {
  int index = 0;

  void selectedIndex(index) {
    this.index = index;
    update();
  }

  List<OnBoardingImageModel> onboardingImageList = [];

  Future getSliderImage() async {
    await getOnboardingImageRequestApi(
            list: onboardingImageList, path: 'OnboardingImage')
        .then((value) {
      update();
    });
  }

  @override
  void onInit() {
    getSliderImage();
    super.onInit();
  }
}
