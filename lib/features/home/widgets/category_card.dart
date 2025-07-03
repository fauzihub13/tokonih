import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  const CategoryCard({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: DefaultColors.blue50,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {},
            splashColor: DefaultColors.blue100,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // color: DefaultColors.blue50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                'assets/icons/notification.svg',
                colorFilter: ColorFilter.mode(
                  DefaultColors.neutral900,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          child: Text(
            categoryName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: DefaultColors.neutral800,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
