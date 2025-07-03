import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final double borderRadius;
  final int maxLines;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Color fillColor;

  const FormInput({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.borderRadius = 16.0,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onTap,
    this.obscureText = false,
    this.onChanged,
    this.inputFormatters,
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      validator: validator,
      onTap: onTap,
      obscureText: obscureText,
      cursorColor: DefaultColors.blue600,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        fillColor: fillColor,
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: Theme.of(context).iconTheme.color,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
