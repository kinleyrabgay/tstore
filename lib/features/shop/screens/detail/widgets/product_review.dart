import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/appbar/appbar.dart';
import 'package:tstore/common/widgets/rating_indicator.dart';
import 'package:tstore/features/shop/screens/detail/widgets/overall_rating_indicator.dart';
import 'package:tstore/features/shop/screens/detail/widgets/user_review.dart';
import 'package:tstore/utils/constants/sizes.dart';

class TProductReviewScreen extends StatelessWidget {
  const TProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Overall Product Rading
              const TOverallRatingIndicator(),

              const TRatingBarIndicator(rating: 4.5),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // User Review List
              const TUserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}
