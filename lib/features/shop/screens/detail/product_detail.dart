import 'package:flutter/material.dart';
import 'package:tstore/features/shop/screens/detail/widgets/product_detail_image_slider.dart';
import 'package:tstore/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Produce Image Slider
            TProduceDetailImageSlider(dark: dark)
          ],
        ),
      ),
    );
  }
}
