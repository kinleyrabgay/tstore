import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/widgets/brand_card.dart';
import 'package:tstore/common/widgets/grid/grid.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/features/shop/screens/all-brands/widget/brand_product.dart';
import 'package:tstore/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              const TSectionHeading(
                showActionButton: false,
                title: 'Brand',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                itemCount: 14,
                mainAxisExtent: 80,
                itemBuilder: (context, idx) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
