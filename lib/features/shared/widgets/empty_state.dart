import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class EmptyState extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subTitle;
  final double size;
  const EmptyState({super.key, required this.iconPath, required this.title, required this.subTitle, this.size = 56});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/state/$iconPath',
            width: size,
            height: size,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: DefaultColors.neutral800),
          ),
        ],
      ),
    );
  }
}
