import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/text/section_heading.dart';
import 'package:tstore/features/personalization/screens/address/widgets/single_address.dart';
import 'package:tstore/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          showActionButton: true,
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        const TSingleAddres(
          selectedAddress: false,
        )
      ],
    );
  }
}
