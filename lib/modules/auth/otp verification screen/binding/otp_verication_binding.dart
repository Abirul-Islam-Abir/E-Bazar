import 'package:get/get.dart';

import '../controller/otp_verification_controller.dart';

class OtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpVerificationController());
  }
}
