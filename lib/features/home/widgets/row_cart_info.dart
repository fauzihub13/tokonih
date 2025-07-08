import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class RowCartInfo extends StatelessWidget {
  final String title;
  final double price;
  const RowCartInfo({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: DefaultColors.neutral900),
        ),
        Text(
          '\$$price',
          maxLines: 1,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
