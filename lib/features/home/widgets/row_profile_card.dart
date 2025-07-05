import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class RowProfileCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  final Color? color;
  const RowProfileCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.color = DefaultColors.neutral950,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,

      child: InkWell(
        onTap: onTap,

        splashColor: DefaultColors.neutral50,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: DefaultColors.neutral200)),
          ),
          child: Row(
            spacing: 12,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: ColorFilter.mode(
                    color != null ? color! : DefaultColors.neutral950,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: color != null ? color! : DefaultColors.neutral950,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.chevron_right,
                size: 24,
                color: color != null ? color! : DefaultColors.neutral950,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
