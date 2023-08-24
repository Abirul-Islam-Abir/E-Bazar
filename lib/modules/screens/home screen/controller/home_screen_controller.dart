import '../../../../utils/export.dart';

class HomeScreenController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<ProductModel> productList = [];
  final firestore = FirebaseFirestore.instance;

  Future getAccessoriesProduct() async {
    await getProductRequestApi(list: productList, path: 'Products')
        .then((value) {
      _isLoading = true;
      update();
    });
  }

  ///slider image
  List<SliderImageModel> sliderImageList = [];

  Future getSliderImage() async {
    await getSliderImageRequestApi(list: sliderImageList, path: 'BannerImage')
        .then((value) {
      _isLoading = true;
      update();
    });
  }

  @override
  void onInit() {
    getAccessoriesProduct();
    getSliderImage();
    super.onInit();
  }
}
