import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          // Apply Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                // backgroundColor: TColors.black,
                backgroundColor: Colors.grey.withOpacity(0.4),
                // side: const BorderSide(color: TColors.black),
                side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                foregroundColor: isDark
                    ? TColors.white.withOpacity(0.5)
                    : TColors.dark.withOpacity(0.5),
              ),
              child: Text(
                'Apply',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: TColors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
