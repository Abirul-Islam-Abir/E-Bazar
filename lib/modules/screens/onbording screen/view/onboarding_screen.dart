import '../../../../utils/export.dart';

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
