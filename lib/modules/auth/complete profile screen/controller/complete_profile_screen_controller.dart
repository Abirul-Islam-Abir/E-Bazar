import '../../../../../utils/export.dart';

class CompleteProfileController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUserId = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> addUser() {
    return users.doc().collection(currentUserId).add({
      'Name': '${firstNameController.text} ${lastNameController.text}',
      'Mobile': mobileController.text,
      'Address': addressController.text
    }).then((value) => Get.offAllNamed(RouteName.homeScreen));
  }
}
