import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/auth/views/login_page.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_input.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_label.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscurePasswordConfirmation = true;
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Succes register account"),
          backgroundColor: DefaultColors.green600,
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.horizontal),
          child: Center(
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
                      'Register',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.blue600,
                      ),
                    ),
                    Text(
                      'Create your new account',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    FormLabel(label: 'Full Name'),
                    FormInput(
                      controller: _fullnameController,
                      hintText: 'Enter your full name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This full name field is required.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    FormLabel(label: 'Username'),
                    FormInput(
                      controller: _usernameController,
                      hintText: 'Enter your username',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This username field is required.';
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
                    const SizedBox(height: 10),
                    FormLabel(label: 'Password Confirmation'),
                    FormInput(
                      controller: _passwordConfirmationController,
                      hintText: 'Enter your password confirmation',
                      obscureText: _obscurePasswordConfirmation,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePasswordConfirmation =
                                !_obscurePasswordConfirmation;
                          });
                        },
                        icon:
                            _obscurePasswordConfirmation
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This password confirmation field is required.';
                        } else if (value != _passwordController.text) {
                          return 'This password confirmation doesn\'t match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    MainButton.filled(
                      onPressed: _handleLogin,
                      label: 'Register',
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: DefaultColors.neutral200),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: DefaultColors.neutral200,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(0, 0),
                          ),
                          onPressed: () {
                            // context.pushNamed(RouteName.registerPage);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: DefaultColors.blue600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
