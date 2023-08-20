import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Future<bool> createAccountRequestApi({emailAddress, password}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    if (credential.user != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.snackbar('Wrong!', 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar('Warning!', 'The account already exists for that email.');
    }
  } catch (e) {
    Get.snackbar('Waring!', '$e');
    return false;
  }
  return false;
}
