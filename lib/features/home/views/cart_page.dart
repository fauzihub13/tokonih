import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/home/widgets/cart_product_card.dart';
import 'package:flutter_tokonih/features/home/widgets/row_cart_info.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(title: 'Cart', canBack: false),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: PaddingSize.horizontal,
                  right: PaddingSize.horizontal,
                ),
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        spacing: 4,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Remove From Cart',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),
                                          ),
                                          const Divider(),
                                          CartProductCard(wantToDelete: true),
                                          Row(
                                            spacing: 10,
                                            children: [
                                              Expanded(
                                                child: MainButton.filled(
                                                  height: 50,
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  label: 'No, cancel',
                                                  color:
                                                      DefaultColors.neutral500,
                                                ),
                                              ),
                                              Expanded(
                                                child: MainButton.filled(
                                                  height: 50,
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          "Product has been removed from cart",
                                                        ),
                                                        backgroundColor:
                                                            DefaultColors
                                                                .green600,
                                                      ),
                                                    );
                                                  },
                                                  label: 'Yes, remove',
                                                  color: DefaultColors.red600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            backgroundColor: DefaultColors.red400.withValues(
                              alpha: 0.4,
                            ),
                            foregroundColor: DefaultColors.red600,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: CartProductCard(),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(PaddingSize.horizontal),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(154, 154, 154, 0.2),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              width: double.infinity,
              child: Column(
                spacing: 6,
                children: [
                  RowCartInfo(title: 'Sub-total', price: 170.75),
                  RowCartInfo(title: 'Delivery Fee', price: 20),
                  RowCartInfo(title: 'Discount', price: 10),
                  const Divider(color: DefaultColors.neutral100, thickness: 1),
                  RowCartInfo(title: 'Total', price: 180.99),
                  const SizedBox(height: 10),
                  MainButton.filled(onPressed: () {}, label: 'Go To Checkout'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
