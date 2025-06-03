import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/view/widgets/search_items.dart';
import 'package:e_commerce/view/widgets/single_product.dart';
import 'package:flutter/material.dart';

class ReviewCart extends StatefulWidget {
  const ReviewCart({super.key});

  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text('Review Cart'),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // SearchItems(),
          // SearchItems()
        ],
      ),
    );
  }
}
