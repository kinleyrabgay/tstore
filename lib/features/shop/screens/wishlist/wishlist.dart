import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/appbar/appbar.dart';
import 'package:tstore/common/widgets/grid/grid.dart';
import 'package:tstore/common/widgets/product/circuler_icon.dart';
import 'package:tstore/common/widgets/product/product_card_vertical.dart';
import 'package:tstore/features/shop/screens/home/home.dart';
import 'package:tstore/utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                mainAxisExtent: 260,
                itemCount: 4,
                itemBuilder: (_, idx) => const ProductCardVertical(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
