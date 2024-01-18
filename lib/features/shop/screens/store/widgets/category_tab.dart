import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/brand_showcase.dart';
import 'package:tstore/common/widgets/grid/grid.dart';
import 'package:tstore/common/widgets/product/product_card_vertical.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListView(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Brands
                const TBrandShowCase(
                  images: [
                    TImages.darkAppLogo,
                    TImages.onboardingImage2,
                    TImages.onboardingImage3
                  ],
                ),
                const TBrandShowCase(
                  images: [
                    TImages.darkAppLogo,
                    TImages.onboardingImage2,
                    TImages.onboardingImage3
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                //  Products
                TSectionHeading(
                  showActionButton: true,
                  title: 'You might like',
                  onPressed: () {},
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                TGridLayout(
                  itemCount: 8,
                  mainAxisExtent: 260,
                  itemBuilder: (_, idx) => const ProductCardVertical(),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
