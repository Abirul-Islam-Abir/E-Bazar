import 'package:get/get.dart';

import '../controller/onborading_controller.dart';



class OnboardingScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreenController());
  }
}