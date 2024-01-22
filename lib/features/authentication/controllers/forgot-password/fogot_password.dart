import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/network/internet.dart';
import 'package:tstore/data/repositories/authentication/authentication_repository.dart';
import 'package:tstore/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/loader/loader.dart';
import 'package:tstore/utils/popup/popup.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send reset password email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        TImages.noNotification,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) return;

      // Send email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();
      // Show success
      TLoaders.successSnackBar(
          title: 'Email Sent!',
          message: 'Email link sent to reset your password'.tr);
      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        TImages.noNotification,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();
      // Show success
      TLoaders.successSnackBar(
          title: 'Email Sent!',
          message: 'Email link sent to reset your password'.tr);
      // Redirect
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
