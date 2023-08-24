import '../../../../utils/export.dart';

class CompleteProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteProfileController());
  }
}
