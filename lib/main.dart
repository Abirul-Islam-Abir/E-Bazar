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
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: mainTheme(),
        //  initialRoute: RouteName.matchScreen,
        initialRoute: RouteName.onboardingScreen,
        getPages: appPages(),
      );
    });
  }
}

Future initializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  NotificationService().initializeApp();
  Get.put(FcmMessagingController());
}
