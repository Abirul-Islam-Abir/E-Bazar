import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Future<bool> loginRequestApi({emailAddress, password}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    if (credential.user != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.snackbar('Waring!', 'No user found for that email.');
      return false;
    } else if (e.code == 'wrong-password') {
      Get.snackbar('Waring!', 'Wrong password provided for that user.');
      return false;
    }
  }
  return false;
}
