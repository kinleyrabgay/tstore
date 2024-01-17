import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/brand_showcase.dart';
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
      child: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // Brands
            TBrandShowCase(
              images: [
                TImages.darkAppLogo,
                TImages.onboardingImage2,
                TImages.onboardingImage3
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            //  Products
            TSectionHeading(
              showActionButton: true,
              title: 'You might like product',
            ),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
