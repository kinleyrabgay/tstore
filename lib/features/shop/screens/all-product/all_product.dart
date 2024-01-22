import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/t_sorting.dart';
import 'package:tstore/utils/constants/sizes.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Products')),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace), child: TSorting()),
      ),
    );
  }
}
