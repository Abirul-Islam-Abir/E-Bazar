import 'package:ecommerce_firebase/modules/screens/cart%20screen/cart_screen.dart';

import '../../../../utils/export.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColor.kPurpleColor,
    title: const HeadlineText(text: 'E-Bazar'),
    actions: [
      IconButton(
          onPressed: () async {
            Get.to(const CartScreen());
          },
          icon: const Icon(Icons.shopping_cart_checkout))
    ],
  );
}
