import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/home/views/cart_page.dart';
import 'package:flutter_tokonih/features/home/views/home_page.dart';
import 'package:flutter_tokonih/features/home/views/profile_page.dart';
import 'package:flutter_tokonih/features/home/views/saved_page.dart';

class LandingPage extends StatefulWidget {
  final int index;
  const LandingPage({super.key, this.index = 0});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    HomePage(),
    SavedPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DefaultColors.neutral50,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: DefaultColors.blue700,
        unselectedItemColor: DefaultColors.neutral600,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/navbar/home.svg',
              colorFilter: ColorFilter.mode(
                DefaultColors.blue700,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset('assets/icons/navbar/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/navbar/saved.svg',
              colorFilter: ColorFilter.mode(
                DefaultColors.blue700,

                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset('assets/icons/navbar/saved.svg'),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/navbar/cart.svg',
              colorFilter: ColorFilter.mode(
                DefaultColors.blue700,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset('assets/icons/navbar/cart.svg'),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/navbar/profile.svg',
              colorFilter: ColorFilter.mode(
                DefaultColors.blue700,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset('assets/icons/navbar/profile.svg'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
