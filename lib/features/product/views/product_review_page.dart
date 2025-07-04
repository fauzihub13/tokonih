import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/product/widgets/product_review_card.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';

class ProductReviewPage extends StatefulWidget {
  const ProductReviewPage({super.key});

  @override
  State<ProductReviewPage> createState() => _ProductReviewPageState();
}

class _ProductReviewPageState extends State<ProductReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(title: 'Product Reviews', canBack: true),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: PaddingSize.horizontal,
            right: PaddingSize.horizontal,
            bottom: PaddingSize.vertical,
          ),
          child: ListView.separated(
            itemBuilder: (BuildContext widgetContext, index) {
              return ProductReviewCard(
                rating: index + 1,
                comment: 'hahaha',
                reviewerName: 'John Dae',
                date: DateTime.now(),
              );
            },
            separatorBuilder: (BuildContext separatorContext, index) {
              return SizedBox(height: 0);
            },
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
