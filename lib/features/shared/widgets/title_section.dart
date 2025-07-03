import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TitleSection({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size(0, 0),
          ),
          onPressed: onPressed,
          child: Text(
            'View all',
            textAlign: TextAlign.left,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: DefaultColors.neutral600),
          ),
        ),
      ],
    );
  }
}
