import 'package:ecommerce_firebase/api/get_user_profile_api.dart';
import 'package:ecommerce_firebase/model/user_profile_model.dart';
import 'package:ecommerce_firebase/modules/network%20connectivity/controller/network_connectivity_controller.dart';
import 'package:ecommerce_firebase/utils/shared_pref.dart';
import 'package:ecommerce_firebase/utils/storage_key.dart';
import 'package:ecommerce_firebase/utils/user_collection.dart';

import '../../../../utils/all_instance.dart';
import '../../../../utils/export.dart';

class HomeScreenController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<ProductModel> productList = [];
  List<SliderImageModel> sliderImageList = [];
  List<UserProfileModel> userProfileList = [];
  final firestore = FirebaseFirestore.instance;

  Future getAccessoriesProduct() async {
    await getProductRequestApi(list: productList, path: 'Products');
  }

  Future getSliderImage() async {
    await getSliderImageRequestApi(list: sliderImageList, path: 'BannerImage');
  }

  Future getUserProfileData() async {
    await getUserProfileDataRequestApi(
        path: Collection.collectionProfile, list: userProfileList);
  }

  Future logOut() async {
    storageInstance.remove(StorageKey.setTokenKey);
    await FirebaseAuth.instance.signOut().then(
          (value) => Get.offAllNamed(RouteName.loginScreen),
        );
  }

  Future tokenGet() async {
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
    productList.clear(); // Clear existing data.
    sliderImageList.clear();
    userProfileList.clear();

    try {
      await getAccessoriesProduct();
      await getSliderImage();
      await setupToken();
      await getUserProfileData();
      await tokenGet();
    } catch (e) {
      // Handle any errors that may occur during data loading.
      print('Error loading data: $e');
    } finally {
      if (Get.find<NetworkController>().connectionType == 0) {
        _isLoading =
            false; // Set loading state to false after loading or error.
        update(); // Notify the UI of the change.
        print('-----------------------------------------0');
      } else {
        _isLoading = true; // Set loading state to false after loading or error.
        update(); // Notify the UI of the change.
        print('-----------------------------------------1');
      }
      update(); // Notify the UI of the change.
    }
  }

  @override
  void onInit() {
    reinitializeController();
    super.onInit();
  }
}
