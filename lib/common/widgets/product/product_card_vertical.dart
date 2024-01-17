import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:tstore/common/widgets/product/circuler_icon.dart';
import 'package:tstore/common/widgets/product/price_text.dart';
import 'package:tstore/common/widgets/rounded_image.dart';
import 'package:tstore/common/widgets/shadow.dart';
import 'package:tstore/common/widgets/text/brand_title_with_icon.dart';
import 'package:tstore/common/widgets/text/product_title.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalItemShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 150,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // Thumbnail
                  TRoundedImage(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    imageUrl: TImages.darkAppLogo,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),

                  // Sale Tag
                  Positioned(
                    top: 8,
                    left: 4,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '25 %',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  //
                  const Positioned(
                    top: 4,
                    right: 4,
                    child: TCircularIcon(
                      icon: CupertinoIcons.heart_fill,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: 'Nike Air Shoe',
                    smallSize: true,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerficationIcon(title: 'Nike')
                  // const SizedBox(height: TSizes.spaceBtwItems / 2),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  const TProductPriceText(
                    currencySign: '\$',
                    price: '35',
                    maxLines: 1,
                    isLarge: true,
                    lineThrough: false,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
