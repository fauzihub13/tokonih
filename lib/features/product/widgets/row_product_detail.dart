import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class RowProductDetail extends StatelessWidget {
  final String title;
  final String description;
  const RowProductDetail({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: DefaultColors.neutral800,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: DefaultColors.neutral500,
            ),
          ),
        ),
      ],
    );
  }
}
