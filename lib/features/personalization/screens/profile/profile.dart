import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/appbar/appbar.dart';
import 'package:tstore/common/widgets/image/t_circular_image.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/features/personalization/controllers/user_controller.dart';
import 'package:tstore/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:tstore/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile
              // Ceter
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.facebook,
                      width: 80,
                      height: 80,
                      border: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    )
                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Personal Heading
              const TSectionHeading(
                showActionButton: false,
                title: 'Profile Information',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                // onPressed: () => Get.to(() => const ChangeName()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Personal Heading
              const TSectionHeading(
                showActionButton: false,
                title: 'Personal Information',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'User Id',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Date of Birth',
                value: '12 Aug, 2001',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
