import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class ProductFavouriteButton extends StatefulWidget {
  const ProductFavouriteButton({super.key});

  @override
  State<ProductFavouriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<ProductFavouriteButton> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSaved = !isSaved;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          isSaved ? Icons.favorite : Icons.favorite_border,
          color: isSaved ? DefaultColors.red500 : DefaultColors.neutral800,
          size: 20,
        ),
      ),
    );
  }
}
