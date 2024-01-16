import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/widgets/custom_shape/container/primary_container.dart';
import 'package:tstore/common/widgets/search_field.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/features/shop/screens/home/widgets/home_appbar.dart';
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
                  const THomeAppBart(),
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
                    child: Column(children: [
                      TSectionHeading(
                        showActionButton: false,
                        title: 'Popular Categories',
                        onPressed: () {},
                      )
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
