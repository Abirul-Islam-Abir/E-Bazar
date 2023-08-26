import 'package:ecommerce_firebase/model/user_profile_model.dart';

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
    await getProductRequestApi(list: productList, path: 'Products')
        .then((value) {
      _isLoading = true;
      update();
    });
  }

  Future getSliderImage() async {
    await getSliderImageRequestApi(list: sliderImageList, path: 'BannerImage')
        .then((value) {
      _isLoading = true;
      update();
    });
  }

  Future idTokenChanges() async {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
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

  @override
  void onInit() {
    getAccessoriesProduct();
    getSliderImage();
    setupToken();
    super.onInit();
  }
}
