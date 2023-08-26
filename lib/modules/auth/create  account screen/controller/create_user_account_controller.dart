import 'package:ecommerce_firebase/utils/const.dart';
import 'package:ecommerce_firebase/utils/shared_pref.dart';

import '../../../../utils/export.dart';

class CreateUserAccountController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmFocus = FocusNode();
  final formKey = GlobalKey<FormState>();

  void createAccount() async {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      bool response = await createAccountRequestApi(
          emailAddress: emailController.text.trim(),
          password: passwordController.text.trim());
      if (response == true) {
        storeAccountCreatedData(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            photo: base64ImageUrl);
        Get.toNamed(RouteName.completeProfileScreen);
      } else {
        Get.snackbar('Failed!', 'Account creation failed!');
      }
    }
  }

  void validateSubmit() {
    confirmFocus.unfocus();
    if (formKey.currentState!.validate()) {
      createAccount();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmFocus.dispose();
    formKey.currentState!.reset();
    super.dispose();
  }
}
