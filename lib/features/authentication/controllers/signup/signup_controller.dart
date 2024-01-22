import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/network/internet.dart';
import 'package:tstore/data/repositories/authentication/authentication_repository.dart';
import 'package:tstore/data/repositories/authentication/user/user_model.dart';
import 'package:tstore/data/repositories/authentication/user/user_repository.dart';
import 'package:tstore/features/authentication/screens/signup/verify_email.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/loader/loader.dart';
import 'package:tstore/utils/popup/popup.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  // SignupController();

  // Variable
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastname = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Sign - up
  Future<void> register() async {
    try {
      //  Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.noNotification);
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy & policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the privacy policy & terms of use',
        );
        return;
      }

      // Register user in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Generic error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
