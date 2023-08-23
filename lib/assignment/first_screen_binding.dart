import 'package:ecommerce_firebase/assignment/first_screen_controller.dart';
import 'package:get/get.dart';

class FirstScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstScreenController());
  }
}
