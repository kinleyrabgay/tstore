import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:tstore/common/widgets/item_add.dart';
import 'package:tstore/common/widgets/product/price_text.dart';
import 'package:tstore/features/shop/screens/cart/widget/cart_item.dart';
import 'package:tstore/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemCount: 2,
      itemBuilder: (_, idx) {
        return TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              const TCartItem(),
              if (showAddRemoveButton)
                const SizedBox(height: TSizes.spaceBtwItems),
              if (showAddRemoveButton)
                const Row(
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
    );
  }
}
