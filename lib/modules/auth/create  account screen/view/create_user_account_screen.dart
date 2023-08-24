import '../../../../utils/export.dart';

class CreateUserAccountScreen extends GetView<CreateUserAccountController> {
  const CreateUserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(text: AppString.signUp),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height / 1.2,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeadlineText(text: AppString.registerAccount),
                      SubtitleText(text: AppString.completeDummy)
                    ],
                  ),
                  const SizedBox(height: kPrimaryBigSize),
                  Column(
                    children: [
                      CustomTextField(
                        focusNode: controller.emailFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context)
                              .requestFocus(controller.passwordFocus);
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: controller.emailController,
                        hintText: AppString.email,
                        label: AppString.enterYourEmail,
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.email)),
                      ),
                      const SizedBox(height: kSmallSize),
                      CustomTextField(
                        focusNode: controller.passwordFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context)
                              .requestFocus(controller.confirmFocus);
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: controller.passwordController,
                        hintText: AppString.password,
                        label: AppString.enterYourPassword,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye)),
                      ),
                      const SizedBox(height: kSmallSize),
                      CustomTextField(
                        focusNode: controller.confirmFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).unfocus();
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        controller: controller.confirmPasswordController,
                        hintText: AppString.confirmPassword,
                        label: AppString.enterYourConfirmPassword,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye)),
                      ),
                    ],
                  ),
                  const SizedBox(height: kPrimaryBigSize),
                  GlobalButton(
                    onPress: () {
                      controller.createAccount();
                    },
                    text: AppString.createAccount,
                  ),
                  const SizedBox(height: kPrimaryBigSize),
                  /*  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterSocialButton(
                        onTap: () {},
                        mini: true,
                        buttonType: ButtonType.github,
                      ),
                      FlutterSocialButton(
                        onTap: () {},
                        mini: true,
                        buttonType: ButtonType.facebook,
                      ),
                      FlutterSocialButton(
                        onTap: () {},
                        mini: true,
                        buttonType: ButtonType.google,
                      ),
                    ],
                  ),*/
                  const SizedBox(height: kPrimaryBigSize),
                  LongLineText(
                      onTap: () {
                        Get.offNamed(RouteName.loginScreen);
                      },
                      text: AppString.alreadyHaveAnAccount,
                      btnTxt: AppString.signIn),
                  const Spacer(),
                  const CommonText(
                    text: 'Continuing that confirm to our terms & conditions!',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
