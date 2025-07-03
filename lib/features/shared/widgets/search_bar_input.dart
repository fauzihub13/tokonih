import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class SearchBarInput extends StatelessWidget {
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

  const SearchBarInput({
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
    this.fillColor = DefaultColors.neutral50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(44, 44, 44, 0.075),
            blurRadius: 10,
            spreadRadius: -2,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: TextFormField(
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: DefaultColors.neutral50, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: DefaultColors.neutral50, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: DefaultColors.blue500, width: 1.5),
          ),
        ),
      ),
    );
  }
}
