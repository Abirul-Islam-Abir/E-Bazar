import '../../../../utils/export.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColor.kPurpleColor,
    title: const HeadlineText(text: 'E-Bazar'),
    actions: [
      IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut().then(
                  (value) => Get.offAllNamed(RouteName.loginScreen),
                );
          },
          icon: const Icon(Icons.shopping_cart_checkout))
    ],
  );
}
