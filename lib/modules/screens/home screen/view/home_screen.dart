import 'package:ecommerce_firebase/utils/export.dart';
import 'package:get/get.dart';

import '../../../../model/product_model.dart';
import '../component/build_app_bar.dart';
import '../component/more_button.dart';
import '../component/product_card.dart';
import '../component/slider_widget.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: buildAppBar(),
      body: ListView(
        children: [
          const SizedBox(height: kDefaultSize),
          GetBuilder<HomeScreenController>(builder: (controller) {
            return Visibility(
              visible: controller.isLoading,
              replacement: const CircularProgressIndicator(),
              child: SliderWidget(
                items: List.generate(
                    controller.sliderImageList.length,
                    (index) => Image.network(
                          '${controller.sliderImageList[index].img}',
                          fit: BoxFit.fill,
                        )),
              ),
            );
          }),
          MoreButton(product: 'Products', onTap: () {}),
          GetBuilder<HomeScreenController>(builder: (controller) {
            int length = controller.productList.length <= 6
                ? controller.productList.length
                : 6;
            return Visibility(
              visible: controller.isLoading,
              replacement: const CircularProgressIndicator(),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  ProductModel data = controller.productList[index];
                  return ProductCard(
                    img: '${data.img}',
                    name: '${data.name}',
                    price: '${data.price}',
                    buyNow: () {},
                    isFav: () {},
                  );
                },
              ),
            );
          }),
          MoreButton(product: 'Accessories', onTap: () {}),
          GetBuilder<HomeScreenController>(
              builder: (controller) => Visibility(
                    visible: controller.isLoading,
                    replacement: const CircularProgressIndicator(),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        ProductModel data = controller.productList[index];
                        return ProductCard(
                          img: '${data.img}',
                          name: '${data.name}',
                          price: '${data.price}',
                          buyNow: () {},
                          isFav: () {},
                        );
                      },
                    ),
                  )),
        ],
      ),
    );
  }
}
