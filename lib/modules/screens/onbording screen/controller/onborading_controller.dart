import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  RxInt index = 0.obs;

  void selectedIndex(index) {
    this.index.value = index;
  }

  @override
  void onInit() {
    index.value = 0;
    super.onInit();
  }
}
