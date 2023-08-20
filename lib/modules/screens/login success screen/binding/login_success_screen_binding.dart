import 'package:get/get.dart';

import '../controller/login_success_screen_controller.dart';

class LoginSuccessScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginSuccessScreenController());
  }
}