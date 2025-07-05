import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

enum ButtonStyle { filled, outlined }

class MainButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final bool disabled;
  final double fontSize;

  const MainButton.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = DefaultColors.blue600,
    this.textColor = Colors.white,
    this.borderColor = DefaultColors.blue600,
    this.width = double.infinity,
    this.height = 60.0,
    this.borderRadius = 8.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 18.0,
  });

  const MainButton.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.color = Colors.white,
    this.textColor = DefaultColors.blue600,
    this.borderColor = DefaultColors.blue600,
    this.width = double.infinity,
    this.height = 60.0,
    this.borderRadius = 8.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: color,
          overlayColor:
              style == ButtonStyle.filled
                  ? DefaultColors.blue700
                  : DefaultColors.blue200,
          side:
              style == ButtonStyle.outlined
                  ? BorderSide(color: borderColor, width: 2)
                  : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            if (icon != null) const SizedBox(width: 10.0),
            Text(
              label,
              style: TextStyle(
                color: disabled ? Colors.white : textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
