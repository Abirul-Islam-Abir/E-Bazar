import '../../../../utils/export.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(text: AppString.signIn),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height / 1.2,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeadlineText(text: AppString.welcomeBack),
                      SubtitleText(text: AppString.welcomeDymmy)
                    ],
                  ),
                  const SizedBox(height: kPrimaryBigSize),
                  Column(
                    children: [
                      CustomTextField(
                        validator: validateEmail,
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
                        validator: validatePassword,
                        focusNode: controller.passwordFocus,
                        onFieldSubmitted: (v) {
                          controller.isRemember
                              ? controller.validateSubmit()
                              : Get.snackbar('Warning!', 'Click the checkbox');
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
                    ],
                  ),
                  const SizedBox(height: kDefaultSize),
                  GetBuilder<LoginScreenController>(builder: (controller) {
                    return CheckboxListTile(
                      value: controller.isRemember,
                      onChanged: (value) {
                        controller.isRememberSelect(value);
                      },
                      title: Row(
                        children: [
                          const CommonText(text: AppString.rememberMe),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              AppString.forgotPassword,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }),
                  const SizedBox(height: kPrimaryBigSize),
                  GetBuilder<LoginScreenController>(
                      builder: (controller) => GlobalButton(
                            color: controller.isRemember
                                ? AppColor.kPrimaryColor
                                : AppColor.kGreyColor,
                            onPress: () {
                              controller.isRemember
                                  ? controller.validateSubmit()
                                  : Get.snackbar(
                                      'Warning!', 'Click the checkbox');
                            },
                            text: AppString.login,
                          )),
                  const SizedBox(height: kPrimaryBigSize),
                  /*Row(
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
                  const Spacer(),
                  LongLineText(
                      onTap: () {
                        Get.offNamed(RouteName.createUserAccountScreen);
                      },
                      text: AppString.dontHaveAnAccount,
                      btnTxt: AppString.signUp)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
