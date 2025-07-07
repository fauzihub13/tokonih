import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/helper/auth_local_helper.dart';
import 'package:flutter_tokonih/features/auth/views/login_page.dart';
import 'package:flutter_tokonih/features/home/views/landing_page.dart';

class AppEntryPage extends StatelessWidget {
  const AppEntryPage({super.key});

  Future<bool> checkLoginStatus() async {
    return await AuthLocalHelper().isAuthDataExist();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(backgroundColor: Colors.white, body: Center());
        }

        if (snapshot.hasData && snapshot.data == true) {
          return const LandingPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
