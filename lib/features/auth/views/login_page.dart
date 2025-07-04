import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/home/views/landing_page.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_input.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_label.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.horizontal),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Please login with your registered account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  FormLabel(label: 'Email'),
                  FormInput(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This email field is required.';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  FormLabel(label: 'Password'),
                  FormInput(
                    controller: _passwordController,
                    hintText: 'Enter your password',
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon:
                          _obscurePassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This password field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  MainButton.filled(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print('data validated');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LandingPage();
                            },
                          ),
                        );
                      }
                    },
                    label: 'Login',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
