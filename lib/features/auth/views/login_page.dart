import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/router/route_name.dart';
import 'package:flutter_tokonih/core/router/route_page.dart';
import 'package:flutter_tokonih/core/utils/err_ext.dart';
import 'package:flutter_tokonih/features/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_input.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_label.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';
import 'package:flutter_tokonih/models/response/login_response_model.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(authViewmodelProvider.notifier)
          .login(
            username: _usernameController.text,
            password: _passwordController.text,
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
    final authState = ref.watch(authViewmodelProvider);
    ref.listen<AsyncValue<LoginResponseModel?>>(authViewmodelProvider, (
      previous,
      next,
    ) {
      next.when(
        data: (loginResponse) {
          if (loginResponse != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Succes login into your account"),
                backgroundColor: DefaultColors.green600,
              ),
            );
            RoutePage.isLoggedIn = true;
            context.goNamed(RouteName.landingPage);
          }
        },
        loading: () {},
        error: (failure, stack) {
          final message =
              next.failureMessage ?? 'Failed to login, please try again';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: DefaultColors.red600,
            ),
          );
        },
      );
    });
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
                      'Login',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.blue600,
                      ),
                    ),
                    Text(
                      'Please login with your registered account',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 30),
                    MainButton.filled(
                      onPressed: authState.isLoading ? () {} : _handleLogin,
                      label: authState.when(
                        data: (_) => 'Login',
                        error: (_, __) => 'Login',
                        loading: () => 'Logging in...',
                      ),
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
                            context.pushNamed(RouteName.registerPage);
                          },
                          child: Text(
                            'Register',
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
