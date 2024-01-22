import 'package:flutter/material.dart';
import 'package:tstore/features/shop/screens/order/widget/order_list.dart';
import 'package:tstore/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        // Order
        child: TOrderListItems(),
      ),
    );
  }
}
