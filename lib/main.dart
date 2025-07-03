import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/constant/variables.dart';
import 'package:flutter_tokonih/features/auth/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Variables.appName,
      theme: AppTheme.light,
      home: LoginPage(),
    );
  }
}
