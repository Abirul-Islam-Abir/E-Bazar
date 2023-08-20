import 'package:get/get.dart';

import '../../../../../utils/export.dart';
import '../../../../api/login_api.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  void loginRequest() async {
    bool response = await loginRequestApi(
        emailAddress: emailController.text.trim(),
        password: passwordController.text.trim());
    if (response == true) {
      Get.snackbar('Great!', 'Login successfully');
      Get.offNamed(RouteName.homeScreen);
    }
  }
}
