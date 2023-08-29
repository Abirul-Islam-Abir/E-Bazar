import 'package:ecommerce_firebase/modules/screens/home%20screen/component/custom_slider_image.dart';
import 'package:ecommerce_firebase/modules/screens/home%20screen/component/user_drawer_header.dart';

import '../../../../utils/export.dart';
import '../component/custom_product_grid.dart';
import '../component/custom_product_list.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key})
      : super(key: key); // Fixed the constructor syntax.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const UserDrawer(),
      appBar: buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.reinitializeController();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: kDefaultSize),
              CustomSliderWidget(sliderImageList: controller.sliderImageList),
              MoreButton(product: 'Products', onTap: () {}),
              CustomProductGrid(
                  productList: controller.productList, maxProducts: 6),
              MoreButton(product: 'Accessories', onTap: () {}),
              CustomProductList(
                  productList: controller.productList, maxItems: 2),
              MoreButton(product: 'Popular', onTap: () {}),
              CustomProductGrid(
                  productList: controller.productList, maxProducts: 3)
            ],
          ),
        ),
      ),
    );
  }
}
