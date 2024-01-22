import 'package:flutter/material.dart';
import 'package:tstore/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/device/device_utility.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          OnBoardingController.instace.skipPage();
        },
        child: const Text(
          'Skip',
        ),
      ),
    );
  }
}
