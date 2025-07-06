import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/product/widgets/product_review_card.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/models/response/detail_product_response_model.dart';

class ProductReviewPage extends StatelessWidget {
  final List<Review> reviews;
  const ProductReviewPage({super.key, required this.reviews});

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
            itemCount: reviews.length,
            itemBuilder: (BuildContext widgetContext, index) {
              final review = reviews[index];
              return ProductReviewCard(
                rating: review.rating!,
                comment: review.comment!,
                reviewerName: review.reviewerName!,
                date: review.date!,
              );
            },
            separatorBuilder: (BuildContext separatorContext, index) {
              return SizedBox(height: 0);
            },
          ),
        ),
      ),
    );
  }
}
