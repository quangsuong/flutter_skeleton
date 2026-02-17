import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/utils/locale_support.dart';
import 'package:flutter_skeleton/data/models/login_model.dart';
import 'package:flutter_skeleton/ui/views/login/login_view_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/app_export.dart';
import '../../../core/di/locator.dart';
import '../../../logic/blocs/login/login_bloc.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel loginViewModel =
      ServiceLocator.instance.get<LoginViewModel>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.locale.translate('login'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                'assets/images/splash_logo.png',
                // Replace with your logo asset path
                height: 80,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Login to Your Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: context.locale.translate('username'),
              prefix: Icon(Icons.person),
              controller: _usernameController,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: context.locale.translate('password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            BlocBuilder<LoginBloc, LoginState>(
              bloc: loginViewModel.loginBloc,
              builder: (context, state) {
                // Check for success or failure state and show SnackBar
                if (state is LoginSuccess) {
                  Future.microtask(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successful')),
                    );
                  });
                } else if (state is LoginFailure) {
                  Future.microtask(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  });
                }

                if (state is LoginLoading) {
                  return const Center(
                      child: SpinKitCircle(size: 50, color: Colors.black));
                }
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.white,
                  ),
                  onPressed: () {
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    loginViewModel.login(
                        LoginModel(username: username, password: password));
                  },
                  child: Text(context.locale.translate('login')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
