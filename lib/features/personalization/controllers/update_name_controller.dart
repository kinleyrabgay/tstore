import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tstore/common/network/internet.dart';
import 'package:tstore/data/repositories/authentication/user/user_repository.dart';
import 'package:tstore/features/personalization/controllers/user_controller.dart';
import 'package:tstore/features/personalization/screens/profile/profile.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/loader/loader.dart';
import 'package:tstore/utils/popup/popup.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializations();
    super.onInit();
  }

  Future<void> initializations() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.noNotification);

      // Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // update user's first & last
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx UserValue
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Success
      TLoaders.successSnackBar(
          title: 'Congratualations', message: 'Your name has been updated');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
    }
  }
}
