import 'package:ecommerce_firebase/utils/shared_pref.dart';

import '../../../../utils/export.dart';
import '../../../../utils/storage_key.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isRemember = false;
  isRememberSelect(value) {
    isRemember = value;
    update();
  }

  void loginRequest() async {
    bool response = await loginRequestApi(
        emailAddress: emailController.text.trim(),
        password: passwordController.text.trim());
    if (response == true) {
      storeLoginData(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          remember: true);
      Get.snackbar('Great!', 'Login successfully');
      Get.offNamed(RouteName.homeScreen);
    }
  }

  void validateSubmit() {
    passwordFocus.unfocus();
    if (formKey.currentState!.validate()) {
      storageInstance.write(StorageKey.setIsRemember, isRemember);
      loginRequest();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    formKey.currentState!.reset();
    formKey.currentState!.reset();
    super.dispose();
  }
}
