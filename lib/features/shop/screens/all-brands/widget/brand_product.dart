import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/brand_card.dart';
import 'package:tstore/common/widgets/t_sorting.dart';
import 'package:tstore/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nike'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Details
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),

              // Sorting
              TSorting()
            ],
          ),
        ),
      ),
    );
  }
}
