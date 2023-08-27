import 'package:ecommerce_firebase/utils/shared_pref.dart';
import 'package:ecommerce_firebase/utils/storage_key.dart';
import 'package:ecommerce_firebase/utils/store_data.dart';

import '../../../../../utils/export.dart';
import '../../../../utils/all_instance.dart';
import '../../../../utils/user_collection.dart';

class CompleteProfileController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final formKey = GlobalKey<FormState>();

  Future<void> addUser() {
    return Collection.collectionProfile.doc(Instance.userEmail).set({
      'Email': UserData.userEmail,
      'Password': UserData.userPassword,
      'Name': '${firstNameController.text} ${lastNameController.text}',
      'Mobile': mobileController.text,
      'Address': addressController.text,
      'Photo': UserData.userPhoto,
      'UserToken': UserData.userToken,
      'FcmToken': UserData.userFcmToken
    }).then((value) {
      storeCompleteProfileUserData(
        name: '${firstNameController.text} ${lastNameController.text}',
        address: addressController.text.trim(),
        mobile: mobileController.text,
      );
      Get.offAllNamed(RouteName.homeScreen);
    });
  }

  void getUserProfileData() {
    String? emailData = storageInstance.read(StorageKey.setEmailKey);
    String? passwordData = storageInstance.read(StorageKey.setPasswordKey);
    String? photoData = storageInstance.read(StorageKey.setPhotoKey);
    UserData.userEmail = emailData!;
    UserData.userPassword = passwordData!;
    UserData.userPhoto = photoData!;
  }

  void getUserToken() async {
    String? token = await Instance.currentUser!.getIdToken();
    UserData.userToken = token!;
  }

  void validateSubmit() {
    addressFocus.unfocus();
    if (formKey.currentState!.validate()) {
      addUser();
    }
  }

  @override
  void onInit() {
    getUserProfileData();
    getUserToken();
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    firstNameFocus.dispose();
    lastNameFocus.dispose();
    mobileFocus.dispose();
    addressFocus.dispose();
    formKey.currentState!.reset();
    super.dispose();
  }
}
