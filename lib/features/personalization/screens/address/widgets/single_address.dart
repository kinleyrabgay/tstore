import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class TSingleAddres extends StatelessWidget {
  const TSingleAddres({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? isDark
                      ? TColors.light
                      : TColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '(+975) 77 20 49 70',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '82356 Timmy Caves, South Liana, Maine, 87665, USA',
                maxLines: 2,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
