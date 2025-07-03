import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String label;
  const FormLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.left,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
    );
  }
}
