import '../../../../utils/export.dart';

class LoginSuccessScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginSuccessScreenController());
  }
}
