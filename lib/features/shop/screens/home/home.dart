import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/custom_shape/container/primary_container.dart';
import 'package:tstore/common/widgets/grid/grid.dart';
import 'package:tstore/common/widgets/product/product_card_vertical.dart';
import 'package:tstore/common/widgets/search_field.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/common/widgets/vertical_image.dart';
import 'package:tstore/features/shop/screens/all-product/all_product.dart';
import 'package:tstore/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:tstore/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:tstore/features/shop/screens/sub-categories/categories.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Customer AppBar
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomerAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Search bar
                  const TSearchContainer(
                    showBackground: true,
                    showBorder: true,
                    icon: Iconsax.search_favorite,
                    text: 'Search in store',
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          showActionButton: false,
                          title: 'Popular Categories',
                          onPressed: () {},
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // LIST
                        const THomeCategory(),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Carousel
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(bannerItems: [
                    TImages.darkAppLogo,
                    TImages.onboardingImage1,
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  TSectionHeading(
                    showActionButton: true,
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProductScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Item Card
                  TGridLayout(
                    itemCount: 4,
                    mainAxisExtent: 260,
                    itemBuilder: (_, idx) {
                      return const ProductCardVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, idx) {
          return TVerticalImageText(
            backgroundColor: TColors.white,
            onTap: () => Get.to(() => const SubCategoriesScreen()),
            image: TImages.darkAppLogo,
            textColor: TColors.white,
            title: 'Shoes',
          );
        },
      ),
    );
  }
}
