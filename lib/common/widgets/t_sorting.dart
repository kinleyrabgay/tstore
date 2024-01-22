import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/grid/grid.dart';
import 'package:tstore/common/widgets/product/product_card_vertical.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';

class TSorting extends StatelessWidget {
  const TSorting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownMenu(
          enableFilter: true,
          // width: double.infinity,
          enableSearch: true,
          hintText: 'Sort your products by',
          leadingIcon: const Icon(Iconsax.sort),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: TColors.darkGrey),
          ),
          // label: const Text('Sort by'),
          // controller: ,
          // onSelected: (option) {
          //   setState(() {});
          // },
          initialSelection: const Text('Lower Price'),
          dropdownMenuEntries: [
            'Name',
            'Higher Price',
            'Lover Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map(
                (option) => DropdownMenuEntry(
                  value: option,
                  label: option,
                  style: MenuItemButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                ),
              )
              .toList(),
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        // Products
        TGridLayout(
          itemCount: 4,
          mainAxisExtent: 260,
          itemBuilder: (context, idx) => const ProductCardVertical(),
        )
      ],
    );
  }
}
