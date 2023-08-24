import 'package:ecommerce_firebase/modules/fcm%20pushnotification/controller/fcm_pushnotification_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'modules/fcm pushnotification/local notification service/local_notification_service.dart';
import 'utils/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  NotificationService().initializeApp();
  Get.put(FcmMessagingController());
  runApp(const MyApp());
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("${message.notification!.body}");
  print("${message.notification!.title}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: mainTheme(),
        initialRoute: RouteName.matchScreen,
        //   initialRoute: RouteName.homeScreen,
        getPages: appPages(),
      );
    });
  }
}
