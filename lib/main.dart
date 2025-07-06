import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/constant/variables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Variables.appName,
      theme: AppTheme.light,
      home: Scaffold(body: Center(child: Text(ref.read(exampleProvider)))),
      // home: LoginPage(),
    );
  }
}

@riverpod
String example(Ref ref) {
  return 'hello worldasd';
}
