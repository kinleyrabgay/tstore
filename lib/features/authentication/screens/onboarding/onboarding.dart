import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:tstore/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:tstore/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:tstore/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:tstore/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/text_string.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Scroll Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: TImages.onboardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.onboardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.onboardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),

          // Skip button
          const OnboardingSkip(),

          // Dot naviation
          const OnboardingDotNavigation(),

          // circular button
          const OnboardingNextButton()
        ],
      ),
    );
  }
}
