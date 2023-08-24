import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/api/get_product_api.dart';
import 'package:ecommerce_firebase/api/get_slider_image_api.dart';
import 'package:ecommerce_firebase/model/product_model.dart';
import 'package:ecommerce_firebase/model/slider_image_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<ProductModel> productList = [];
  final firestore = FirebaseFirestore.instance;

  Future getAccessoriesProduct() async {
    await getProductRequestApi(list: productList, path: 'Products').then(
      (value) {
          _isLoading=true;
          update();
      }

    );
  }
  ///slider image
  List<SliderImageModel> sliderImageList = [];
  Future getSliderImage() async {
    await getSliderImageRequestApi(list: sliderImageList, path: 'BannerImage').then(
            (value) {
          _isLoading=true;
          update();
        }
    );
  }
  @override
  void onInit() {
    getAccessoriesProduct();getSliderImage();
    super.onInit();
  }
}
