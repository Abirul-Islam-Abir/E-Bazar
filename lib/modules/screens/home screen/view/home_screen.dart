import 'package:ecommerce_firebase/modules/screens/home%20screen/component/custom_slider_image.dart';
import 'package:ecommerce_firebase/modules/screens/home%20screen/component/lists.dart';
import 'package:ecommerce_firebase/modules/screens/home%20screen/component/user_drawer_header.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

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
              CustomSliderWidget(sliderImageList: sliderImageList),
              GetBuilder<HomeScreenController>(
                  builder: (controller) => controller.isLoading
                      ? MoreButton(product: 'Products', onTap: () {})
                      : const ListTileShimmer()),
              CustomProductGrid(productList: productList, maxProducts: 4),
              GetBuilder<HomeScreenController>(
                  builder: (controller) => controller.isLoading
                      ? MoreButton(product: 'Accessories', onTap: () {})
                      : const ListTileShimmer()),
              CustomProductList(productList: productList, maxItems: 2),
              GetBuilder<HomeScreenController>(
                  builder: (controller) => controller.isLoading
                      ? MoreButton(product: 'Popular', onTap: () {})
                      : const ListTileShimmer()),
              CustomProductGrid(productList: productList, maxProducts: 3)
            ],
          ),
        ),
      ),
    );
  }
}
