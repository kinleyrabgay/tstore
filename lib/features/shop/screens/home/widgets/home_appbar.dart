import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/widgets/appbar/appbar.dart';
import 'package:tstore/common/widgets/cart/cart.dart';
import 'package:tstore/common/widgets/shimmer.dart';
import 'package:tstore/features/personalization/controllers/user_controller.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/text_string.dart';

class THomerAppBar extends StatelessWidget {
  const THomerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(() {
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
        ],
      ),
      action: [
        TCart(
          iconColor: Colors.white,
          onPressed: () {},
        ),
        // TCartBadge(
        //   iconColor: Colors.white,
        // )
      ],
    );
  }
}
