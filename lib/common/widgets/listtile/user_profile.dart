import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/image/t_circular_image.dart';
import 'package:tstore/common/widgets/shimmer.dart';
import 'package:tstore/features/personalization/controllers/user_controller.dart';
import 'package:tstore/utils/constants/colors.dart';

class TProfile extends StatelessWidget {
  const TProfile({
    super.key,
    required this.imgUrl,
    this.onPressed,
  });

  final String imgUrl;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : imgUrl;
        return controller.imageUploading.value
            ? const TShimmerEffect(
                width: 80,
                height: 80,
                radius: 80,
              )
            : TCircularImage(
                image: image,
                isNetworkImage: networkImage.isNotEmpty,
                width: 80,
                height: 80,
                border: 80,
              );
      }),
      title: Obx(() {
        if (controller.profileLoading.value) {
          return const TShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          );
        }
      }),
      subtitle: Obx(() {
        if (controller.profileLoading.value) {
          return const TShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white),
          );
        }
      }),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
