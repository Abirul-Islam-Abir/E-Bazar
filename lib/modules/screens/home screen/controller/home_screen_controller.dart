import 'package:ecommerce_firebase/api/get_user_profile_api.dart';
import 'package:ecommerce_firebase/utils/shared_pref.dart';
import 'package:ecommerce_firebase/utils/storage_key.dart';
import 'package:ecommerce_firebase/utils/user_collection.dart';

import '../../../../utils/all_instance.dart';
import '../../../../utils/export.dart';
import '../component/lists.dart';

class HomeScreenController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final firestore = FirebaseFirestore.instance;

  Future<void> getAccessoriesProduct() async {
    await getProductRequestApi(list: productList, path: 'Products');
  }

  Future<void> getSliderImage() async {
    await getSliderImageRequestApi(list: sliderImageList, path: 'BannerImage');
  }

  Future<void> getUserProfileData() async {
    await getUserProfileDataRequestApi(
        path: Collection.collectionProfile, list: userProfileList);
  }

  Future<void> logOut() async {
    storageInstance.remove(StorageKey.setTokenKey);
    await FirebaseAuth.instance.signOut().then(
          (value) => Get.offAllNamed(RouteName.loginScreen),
        );
  }

  Future<void> tokenGet() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var token = await user.getIdToken();
      storageInstance.write(StorageKey.setTokenKey, token);
    }
  }

  Future<void> saveTokenToDatabase(String token) async {
    await FirebaseFirestore.instance
        .collection('UserProfile')
        .doc(Instance.userEmail)
        .update({
      'FcmToken': token,
    });
  }

  Future<void> setupToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    await saveTokenToDatabase(token!);
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  void reinitializeController() async {
    _isLoading = false; // Set loading state to true.
    update(); // Notify the UI of the change.

    try {
      productList.clear(); // Clear existing data.
      sliderImageList.clear();
      userProfileList.clear();
      await getUserProfileData();
      await getAccessoriesProduct();
      await getSliderImage();
      await setupToken();
      await tokenGet();
      refreshPage();
    } catch (e) {
      // Handle any errors that may occur during data loading.
      print('Error loading data: $e');
    } finally {
      _isLoading = true; // Set loading state to false after loading or error.
      update();
    }
  }

  Future<void> refreshPage() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      update();
    });
  }

  @override
  void onInit() {
    reinitializeController();
    super.onInit();
  }
}
