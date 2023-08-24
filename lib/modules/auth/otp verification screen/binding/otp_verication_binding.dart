import '../../../../utils/export.dart';

class OtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpVerificationController());
  }
}
