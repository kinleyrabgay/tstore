import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/divider.dart';
import 'package:tstore/common/widgets/social_button.dart';
import 'package:tstore/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_string.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSignupForm(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections),
              TFormDivider(dark: dark, divierText: TTexts.orSignInWith),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
