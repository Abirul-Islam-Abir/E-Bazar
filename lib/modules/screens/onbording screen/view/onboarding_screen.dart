import 'package:ecommerce_firebase/modules/widget/headline_text.dart';
import 'package:ecommerce_firebase/modules/widget/subtitle_text.dart';
import 'package:ecommerce_firebase/utils/app_size.dart';
import 'package:ecommerce_firebase/utils/base64_image_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';

import '../../../../routes/app_route_name.dart';
import '../../../../utils/app_string.dart';
import '../controller/onborading_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnboardingScreenController>(
          builder: (controller) => OnBoardingSlider(
                headerBackgroundColor: Colors.white,
                finishButtonText: AppString.letsGetStarted,
                finishButtonStyle: const FinishButtonStyle(
                  backgroundColor: Colors.black,
                ),
                skipTextButton: const Text(AppString.skip),
                onFinish: () {
                  Get.offAllNamed(RouteName.loginScreen);
                },
                trailing: const Text(AppString.signUp),
                background: List.generate(
                  controller.onboardingImageList.length,
                  (index) => SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Image.memory(
                        decodeBase64Image(
                            '${controller.onboardingImageList[index].img}'),
                        height: Get.height / 2.5,
                        width: Get.width / 1.5,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                totalPage: controller.onboardingImageList.length,
                speed: 1.8,
                pageBodies: List.generate(
                  controller.onboardingImageList.length,
                  (index) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kPrimaryBigSize),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: kDefaultSize),
                        HeadlineText(
                            text:
                                '${controller.onboardingImageList[index].title}'),
                        SubtitleText(
                            text:
                                '${controller.onboardingImageList[index].subtitle}'),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
