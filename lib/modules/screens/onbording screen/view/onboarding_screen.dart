
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

import '../../../../routes/app_route_name.dart';
import '../../../../theme/app_color.dart';
import '../component/page_view_card.dart';
import '../controller/onborading_controller.dart';

class OnboardingScreen extends GetView<OnboardingScreenController> {
  OnboardingScreen({super.key});

  final onboardingPagesList = [
    PageModel(
      widget: const PageViewCard(
        headline: 'TOKOTA',
        subtitle: 'Welcome to Tokota.Let\'s try to shop!',
        img: 'assets/images/splash_1.png',
      ),
    ),
    PageModel(
      widget: const PageViewCard(
        headline: 'TOKOTA',
        subtitle:
            'Toyota Motor Corp (Toyota) is an automobile manufacturer. The company designs, manufactures and sells passenger cars, buses, minivans, trucks, specialty cars, recreational and sport-utility vehicles.',
        img: 'assets/images/splash_2.png',
      ),
    ),
    PageModel(
      widget: const PageViewCard(
        headline: 'TOKOTA',
        subtitle:
            'Toyota strives to be a strong corporate citizen, engaging with and earning the trust of its stakeholders, and to contribute to the creation of a prosperous',
        img: 'assets/images/splash_3.png',
      ),
    ),
  ];

  Material skipButton() {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          controller.index.value = 2;
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Get.offAllNamed(RouteName.createUserAccountScreen);
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            controller.selectedIndex(pageIndex);
          },
          startPageIndex: controller.index.value,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return buildDecoratedBox(dragDistance, pagesLength);
          },
        )),
    );
  }

  DecoratedBox buildDecoratedBox(double dragDistance, int pagesLength) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0.0,
          color: background,
        ),
      ),
      child: ColoredBox(
        color: AppColor.kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIndicator(
                  netDragPercent: dragDistance,
                  pagesLength: 3,
                  indicator: Indicator(
                    activeIndicator:
                        const ActiveIndicator(color: AppColor.kWhiteColor),
                    indicatorDesign: IndicatorDesign.polygon(
                      polygonDesign: PolygonDesign(
                          polygon: DesignType.polygon_square,
                          polygonSpacer: 14.0),
                    ),
                  )), controller.index.value == pagesLength - 1
                  ? signupButton
                  : skipButton()
            ],
          ),
        ),
      ),
    );
  }
}
