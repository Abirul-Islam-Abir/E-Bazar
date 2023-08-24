import '../assignment/first_screen.dart';
import '../assignment/first_screen_binding.dart';
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
