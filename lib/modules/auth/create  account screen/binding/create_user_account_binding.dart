import '../../../../utils/export.dart';

class CreateUserAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateUserAccountController());
  }
}
