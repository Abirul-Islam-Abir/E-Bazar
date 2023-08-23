import 'package:ecommerce_firebase/assignment/first_screen.dart';
import 'package:ecommerce_firebase/assignment/first_screen_binding.dart';
import 'package:get/get.dart';

import '../modules/auth/complete profile screen/binding/complete_profile_screen_binding.dart';
import '../modules/auth/complete profile screen/view/complete_profile_screen.dart';
import '../modules/auth/login screen/view/login_screen.dart';
import '../modules/auth/otp verification screen/binding/otp_verication_binding.dart';
import '../modules/auth/otp verification screen/view/otp_verification_screen.dart';
import '../modules/screens/login success screen/binding/login_success_screen_binding.dart';
import '../modules/screens/login success screen/view/login_success_screen.dart';
import '../utils/export.dart';

List<GetPage<dynamic>>? appPages() => [
      GetPage(
          name: RouteName.onboardingScreen,
          page: () => OnboardingScreen(),
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
          page: () => const HomeScreen(),
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
    ];
