import 'package:get/get.dart';

import '../../../../../utils/export.dart';
import '../controller/complete_profile_screen_controller.dart';

class CompleteProfileScreen extends GetView<CompleteProfileController> {
  const CompleteProfileScreen({super.key});

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
                      HeadlineText(text: AppString.completeProfile),
                      SubtitleText(text: AppString.completeDummy)
                    ],
                  ),
                  const SizedBox(height: kPrimaryBigSize),
                  Column(
                    children: [
                      CustomTextField(
                        focusNode: controller.firstNameFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context)
                              .requestFocus(controller.lastNameFocus);
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: controller.firstNameController,
                        hintText: AppString.firstName,
                        label: AppString.enterYourFirstName,
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.man)),
                      ),
                      const SizedBox(height: kSmallSize),
                      CustomTextField(
                        focusNode: controller.lastNameFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context)
                              .requestFocus(controller.mobileFocus);
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        controller: controller.lastNameController,
                        hintText: AppString.lastName,
                        label: AppString.enterYourLastName,
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.man)),
                      ),
                      const SizedBox(height: kSmallSize),
                      CustomTextField(
                        focusNode: controller.mobileFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context)
                              .requestFocus(controller.addressFocus);
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        controller: controller.mobileController,
                        hintText: AppString.mobileNumber,
                        label: AppString.enterYourMobileNumber,
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.numbers)),
                      ),
                      const SizedBox(height: kSmallSize),
                      CustomTextField(
                        focusNode: controller.addressFocus,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).unfocus();
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: controller.addressController,
                        hintText: AppString.address,
                        label: AppString.enterYourAddress,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.location_on)),
                      ),
                    ],
                  ),
                  const SizedBox(height: kPrimaryBigSize),
                  GlobalButton(
                    onPress: () {
                      //  controller.addUser();
                    },
                    text: AppString.continues,
                  ),
                  const SizedBox(height: kPrimaryBigSize),
                  /* Row(
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
                  //firestore ta add koren
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
