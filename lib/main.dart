import 'package:ecommerce_firebase/modules/network%20connectivity/controller/network_connectivity_controller.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/export.dart';

Future<void> main() async {
  await initializeApp();
}

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  NotificationService().initializeApp();
  Get.put(FcmMessagingController());
  Get.put(NetworkController());
  runApp(const MyApp());
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (message.notification != null) {
    NotificationService().showNotification('${message.notification!.title}',
        '${message.notification!.body}', '${message.notification!.android}');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>
      Sizer(builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Bazar',
          theme: mainTheme(),
          initialRoute: RouteName.loginScreen,
          getPages: appPages(),
        );
      });
}
