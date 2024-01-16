import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/spacing_style.dart';
import 'package:tstore/common/widgets/divider.dart';
import 'package:tstore/common/widgets/social_button.dart';
import 'package:tstore/features/authentication/screens/login/widgets/login_form.dart';
import 'package:tstore/features/authentication/screens/login/widgets/login_header.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_string.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const TLoginHeader(),
              const TLoginForm(),
              TFormDivider(
                dark: dark,
                divierText: TTexts.orSignInWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
