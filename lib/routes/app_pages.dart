import 'package:ecommerce_firebase/admin/user_list_screen/view/user_list_screen.dart';
import 'package:ecommerce_firebase/modules/screens/map%20screen/binding/map_screen_binding.dart';
import 'package:ecommerce_firebase/modules/screens/map%20screen/view/map_screen.dart';
import 'package:ecommerce_firebase/modules/screens/profile%20update%20screen/binding/profile_update_binding.dart';
import 'package:ecommerce_firebase/modules/screens/splash%20screen/binding/splash_screen_binding.dart';
import 'package:ecommerce_firebase/modules/screens/splash%20screen/view/splash_screen.dart';
import '../assignment/first_screen.dart';
import '../assignment/first_screen_binding.dart';
import '../modules/screens/profile update screen/view/profile_update_screen.dart';
import '../utils/export.dart';

List<GetPage<dynamic>>? appPages() => [
      GetPage(
          name: RouteName.onboardingScreen,
          page: () => const OnboardingScreen(),
          binding: OnboardingScreenBindings(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.createUserAccountScreen,
          page: () => const CreateUserAccountScreen(),
          binding: CreateUserAccountBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.homeScreen,
          page: () =>  HomeScreen(),
          binding: HomeScreenBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.loginScreen,
          page: () => const LoginScreen(),
          binding: LoginScreenBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.completeProfileScreen,
          page: () => const CompleteProfileScreen(),
          binding: CompleteProfileScreenBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.otpVerificationScreen,
          page: () => const OtpVerificationScreen(),
          binding: OtpVerificationBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.loginSuccessScreen,
          page: () => const LoginSuccessScreen(),
          binding: LoginSuccessScreenBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.matchScreen,
          page: () => const FirstScreen(),
          binding: FirstScreenBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.userAccountList,
          page: () => const UserAccountList(),
          binding: FirstScreenBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          binding: SplashScreenBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.updateProfileScreen,
          page: () => const ProfileUpdateScreen(),
          binding: ProfileUpdateBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.mapScreen,
          page: () => const MapScreen(),
          binding: MapScreenBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
    ];
