import 'package:get_storage/get_storage.dart';

import 'utils/export.dart';

Future<void> main() async {
  await initializer();
  runApp(const MyApp());
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>
      Sizer(builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: mainTheme(),
          // initialRoute: RouteName.matchScreen,
          initialRoute: RouteName.splashScreen,
          // initialRoute: RouteName.userAccountList,
          getPages: appPages(),
        );
      });
}

Future initializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  NotificationService().initializeApp();
  Get.put(FcmMessagingController());
}
