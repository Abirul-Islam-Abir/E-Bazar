import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../api/create_account_api.dart';
import '../../../../routes/app_route_name.dart';

class CreateUserAccountController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmFocus = FocusNode();

  void createAccount() async {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      bool response = await createAccountRequestApi(
          emailAddress: emailController.text.trim(),
          password: passwordController.text.trim());
      if (response == true) {
        Get.toNamed(RouteName.completeProfileScreen);
      } else {
        Get.snackbar('Failed!', 'Account creation failed!');
      }
    }
  }

  var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://firebase.flutter.dev/docs/auth/email-link-auth',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.firebase2',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12');

  Future<void> verifyEmail() async {
    FirebaseAuth.instance
        .sendSignInLinkToEmail(
            email: 'abir80503@gmail.com', actionCodeSettings: acs)
        .catchError((onError) => print(onError.toString()))
        .then((value) => Get.offAllNamed(
              RouteName.otpVerificationScreen,
            ));
  }
}
