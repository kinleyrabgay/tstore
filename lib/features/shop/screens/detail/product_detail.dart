import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/features/shop/screens/detail/widgets/product_add_to_card.dart';
import 'package:tstore/features/shop/screens/detail/widgets/product_attributes.dart';
import 'package:tstore/features/shop/screens/detail/widgets/product_detail_image_slider.dart';
import 'package:tstore/features/shop/screens/detail/widgets/product_metadata.dart';
import 'package:tstore/features/shop/screens/detail/widgets/product_rating.dart';
import 'package:tstore/features/shop/screens/detail/widgets/product_review.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Produce Image Slider
            const TProduceDetailImageSlider(),

            // Product details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Ratting
                  const TRating(),

                  // Price, Title, Stokc, & Brand (Product Metadata)
                  const TProductMetaData(),

                  // Attributes
                  const TProductAttributes(),

                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: TSizes.md,
                        //   vertical: TSizes.lg,
                        // ),
                        backgroundColor: TColors.black,
                        side: const BorderSide(
                          color: TColors.black,
                        ),
                      ),
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Description
                  const TSectionHeading(
                    showActionButton: false,
                    title: 'Description',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a product description for blue nike sleeve less vest. There are more things that can be added but i am buying it',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  //  Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        showActionButton: false,
                        title: 'Reviews(199)',
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const TProductReviewScreen()),
                        icon: const Icon(
                          CupertinoIcons.chevron_forward,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
