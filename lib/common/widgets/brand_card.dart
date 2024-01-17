import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:tstore/common/widgets/image/t_circular_image.dart';
import 'package:tstore/common/widgets/text/brand_title_with_icon.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/enums.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: TCircularImage(
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.dark,
                image: TImages.onboardingImage2,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerficationIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
