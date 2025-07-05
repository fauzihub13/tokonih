import 'package:flutter/material.dart';
import 'package:flutter_tokonih/features/shared/widgets/empty_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: EmptyState(
            iconPath: 'cart.svg',
            title: 'Your Cart Is Empty!',
            subTitle: 'When you add products, they’ll appear here.',
          ),
        ),
      ),
    );
  }
}
