import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/appbar/appbar.dart';
import 'package:tstore/common/widgets/cart/cart.dart';
import 'package:tstore/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:tstore/common/widgets/image/t_circular_image.dart';
import 'package:tstore/common/widgets/search_field.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          TCart(
            iconColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrollable) {
          return [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Search
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(
                      text: 'text',
                      showBackground: false,
                      showBorder: true,
                      icon: Iconsax.search_favorite,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Feature Heading
                    TSectionHeading(
                      showActionButton: true,
                      title: 'Feature Brands',
                      onPressed: () {},
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                    // Card
                    TRoundedContainer(
                      padding: const EdgeInsets.all(TSizes.sm),
                      showBorder: true,
                      backgroundColor: Colors.transparent,
                      child: Row(
                        children: [
                          TCircularImage(
                            overlayColor: THelperFunctions.isDarkMode(context)
                                ? TColors.white
                                : TColors.dark,
                            image: TImages.onboardingImage2,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),

                          // Text
                          Column(
                            children: [
                              
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
