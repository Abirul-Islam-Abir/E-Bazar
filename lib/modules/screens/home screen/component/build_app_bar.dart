import '../../../../utils/export.dart';
import '../../../fcm pushnotification/local notification service/local_notification_service.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColor.kPurpleColor,
    title: const HeadlineText(text: 'E-Bazar'),
    actions: [
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.shopping_cart_checkout))
    ],
  );
}
