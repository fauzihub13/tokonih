import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/router/route_name.dart';
import 'package:flutter_tokonih/features/order/widgets/payment_option_card.dart';
import 'package:flutter_tokonih/features/order/widgets/row_cart_info.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_input.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int paymentIndex = 0;
  List paymentOptions = [
    {'icon': Icons.credit_card, 'label': 'Card'},
    {'icon': Icons.payments, 'label': 'Cash'},
    {'icon': Icons.qr_code, 'label': 'QRIS'},
  ];

  void setPayment(index) {
    setState(() {
      paymentIndex = index;
      // print(paymentOptions[index]['label']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(title: 'Checkout', canBack: true),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: PaddingSize.horizontal,
            right: PaddingSize.horizontal,
            bottom: PaddingSize.vertical,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                const Divider(color: DefaultColors.neutral100),
                Text(
                  'Delivery Address',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.room, color: DefaultColors.neutral400, size: 26),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '925 S Chugach St #APT 10, Alaska 99645',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(color: DefaultColors.neutral100),
                Text(
                  'Payment Method',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
                  spacing: 16,
                  children: List.generate(paymentOptions.length, (index) {
                    final option = paymentOptions[index];
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setPayment(index);
                        },
                        child: PaymentOptionCard(
                          icon: option['icon'],
                          label: option['label'],
                          isSelected: paymentIndex == index,
                        ),
                      ),
                    );
                  }),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: DefaultColors.neutral200,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3578 **** **** 2512',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.edit,
                        size: 26,
                        color: DefaultColors.neutral400,
                      ),
                    ],
                  ),
                ),
                const Divider(color: DefaultColors.neutral100),
                Text(
                  'Order Summary',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                RowCartInfo(title: 'Sub-total', price: 170.75),
                RowCartInfo(title: 'Delivery Fee', price: 20),
                RowCartInfo(title: 'Discount', price: 10),
                const Divider(color: DefaultColors.neutral100, thickness: 1),
                RowCartInfo(title: 'Total', price: 180.99),
                const SizedBox(height: 10),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 3,
                      child: FormInput(
                        controller: TextEditingController(),
                        hintText: 'Enter promo code',
                        prefixIcon: Icon(Icons.sell),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MainButton.filled(
                        onPressed: () {},
                        label: 'Add',
                        height: 54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                MainButton.filled(
                  onPressed: () {
                    context.pushReplacementNamed(
                      RouteName.landingPage,
                      extra: 0,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Your order has been placed"),
                        backgroundColor: DefaultColors.green600,
                      ),
                    );
                  },
                  label: 'Place Order',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
