import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tstore/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:tstore/common/widgets/item_add.dart';
import 'package:tstore/common/widgets/product/price_text.dart';
import 'package:tstore/features/shop/screens/cart/widget/cart_item.dart';
import 'package:tstore/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          itemCount: 8,
          itemBuilder: (_, idx) {
            return const TRoundedContainer(
              showBorder: true,
              padding: EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  TCartItem(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 70),
                          // ADD & REMOVE
                          TQuantityAddRemoveButton(),
                        ],
                      ),

                      // Price
                      TProductPriceText(price: '25')
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Checkout \$256'),
        ),
      ),
    );
  }
}
