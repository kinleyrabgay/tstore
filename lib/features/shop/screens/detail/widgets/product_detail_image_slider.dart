import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/appbar/appbar.dart';
import 'package:tstore/common/widgets/custom_shape/curve/curve_edges_widget.dart';
import 'package:tstore/common/widgets/product/circuler_icon.dart';
import 'package:tstore/common/widgets/rounded_image.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class TProduceDetailImageSlider extends StatelessWidget {
  const TProduceDetailImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CurveEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            // Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(
                  TSizes.productImageRadius * 2,
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.onboardingImage1),
                  ),
                ),
              ),
            ),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 10,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, idx) => TRoundedImage(
                    width: 80,
                    border: Border.all(color: TColors.primary),
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    imageUrl: TImages.lightAppLogo,
                  ),
                ),
              ),
            ),

            // AppBar
            const TAppBar(
              showBackArrow: true,
              action: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}
