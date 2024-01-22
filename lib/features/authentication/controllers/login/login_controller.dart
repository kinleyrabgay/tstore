import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tstore/common/network/internet.dart';
import 'package:tstore/data/repositories/authentication/authentication_repository.dart';
import 'package:tstore/features/personalization/controllers/user_controller.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/loader/loader.dart';
import 'package:tstore/utils/popup/popup.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variable
  final hidePassword = false.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  final userController = Get.put(UserController());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Login - up
  Future<void> login() async {
    try {
      //  Start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.noNotification);
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) return;

      // Save
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Register user in firebase
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'You are logged in!');
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Generic error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.noNotification,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Auth
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user records
      await userController.saveUserRecord(userCredentials);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
