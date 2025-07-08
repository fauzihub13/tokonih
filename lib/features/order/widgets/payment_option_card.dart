import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool? isSelected;
  const PaymentOptionCard({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected! ? DefaultColors.blue600 : DefaultColors.blue50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected! ? Colors.white : DefaultColors.blue600,
            size: 20,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isSelected! ? Colors.white : DefaultColors.blue600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
