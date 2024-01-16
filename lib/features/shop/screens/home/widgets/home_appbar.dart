import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/appbar/appbar.dart';
import 'package:tstore/common/widgets/cart/cart.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/text_string.dart';

class THomeAppBart extends StatelessWidget {
  const THomeAppBart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
        ],
      ),
      action: [
        TCart(
          iconColor: Colors.white,
          onPressed: () {},
        ),
        // TCartBadge(
        //   iconColor: Colors.white,
        // )
      ],
    );
  }
}
