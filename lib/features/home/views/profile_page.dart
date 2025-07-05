import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/home/widgets/row_profile_card.dart';
import 'package:flutter_tokonih/features/product/views/manage_product_page.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> actions = [
      {
        'iconPath': 'assets/icons/navbar/profile.svg',
        'title': 'Edit Profile',
        'onTap': () {
          print('edit profile');
        },
        'color': null,
      },
      {
        'iconPath': 'assets/icons/my_order.svg',
        'title': 'My Order',
        'onTap': () {
          print('my order');
        },
        'color': null,
      },
      {
        'iconPath': 'assets/icons/payment_method.svg',
        'title': 'Payment Methods',
        'onTap': () {
          print('payment method');
        },
        'color': null,
      },
      {
        'iconPath': 'assets/icons/notification.svg',
        'title': 'Notifications',
        'onTap': () {
          print('Notifications');
        },
        'color': null,
      },
      {
        'iconPath': 'assets/icons/product.svg',
        'title': 'Manage Product',
        'onTap': () {
          print('Manage Product');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ManageProductPage();
              },
            ),
          );
        },
        'color': null,
      },
      {
        'iconPath': 'assets/icons/privacy.svg',
        'title': 'Privacy and Policy',
        'onTap': () {
          print('Privacy and Policy');
        },
        'color': null,
      },
      {
        'iconPath': 'assets/icons/help.svg',
        'title': 'Help Center',
        'onTap': () {
          print('Help Center');
        },
        'color': null,
      },

      {
        'iconPath': 'assets/icons/logout.svg',
        'title': 'Logout',
        'onTap': () {
          print('Logout');
        },
        'color': DefaultColors.red600,
      },
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(title: 'Profile', canBack: false),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: PaddingSize.horizontal,
            right: PaddingSize.horizontal,
            bottom: PaddingSize.vertical,
          ),
          child: ListView.builder(
            itemCount: actions.length,
            itemBuilder: (context, index) {
              final data = actions[index];
              return RowProfileCard(
                iconPath: data['iconPath'],
                title: data['title'],
                onTap: data['onTap'],
                color: data['color'],
              );
            },
          ),
        ),
      ),
    );
  }
}
