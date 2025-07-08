import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/constant/variables.dart';
import 'package:flutter_tokonih/core/helper/auth_local_helper.dart';
import 'package:flutter_tokonih/core/router/route_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RoutePage.isLoggedIn = await AuthLocalHelper().isAuthDataExist();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Variables.appName,
      theme: AppTheme.light,
      routerConfig: RoutePage.goRouter,
    );
  }
}
