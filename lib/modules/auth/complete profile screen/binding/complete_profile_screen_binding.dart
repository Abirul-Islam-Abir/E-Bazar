import 'package:get/get.dart';

import '../controller/complete_profile_screen_controller.dart';

class CompleteProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteProfileController());
  }
}
