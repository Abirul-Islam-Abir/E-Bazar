import '../../../../utils/export.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColor.kPurpleColor,
    title: const HeadlineText(text: 'E-Bazar'),
    actions: [
      IconButton(
          onPressed: () async {},
          icon: const Icon(Icons.shopping_cart_checkout))
    ],
  );
}
