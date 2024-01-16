import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCart extends StatelessWidget {
  const TCart({
    super.key,
    required this.iconColor,
    this.onPressed,
  });

  final Color iconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.shopping_bag,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text(
              '8',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: iconColor),
            )),
          ),
        ),
      ],
    );
  }
}
