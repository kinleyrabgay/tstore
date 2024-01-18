import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/color_chip.dart';
import 'package:tstore/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:tstore/common/widgets/product/price_text.dart';
import 'package:tstore/common/widgets/text/product_title.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Selected Attributes Pricing & Description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: isDark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              // TiTle, Price, Stock
              Row(
                children: [
                  const TSectionHeading(
                    showActionButton: false,
                    title: 'Variation',
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price: ',
                            smallSize: true,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          // Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          // Sale Price
                          const TProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock:',
                            smallSize: true,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // Variation Description
              const TProductTitleText(
                title:
                    'This is the description of the product and it can go up to max 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              showActionButton: false,
              title: 'Colors',
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TColorChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                TColorChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                TColorChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              showActionButton: false,
              title: 'Size',
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TColorChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                TColorChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                TColorChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
