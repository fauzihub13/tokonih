import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/product/views/add_new_product_page.dart';

class AddNewProductButton extends StatelessWidget {
  const AddNewProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DefaultColors.blue700,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNewProductPage();
              },
            ),
          );
        },
        splashColor: DefaultColors.blue600,
        borderRadius: BorderRadius.circular(10),

        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 60,
          width: 60,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
