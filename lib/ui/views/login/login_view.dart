import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/data/models/login_model.dart';
import 'package:flutter_skeleton/ui/views/login/login_view_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/di/locator.dart';
import '../../../logic/blocs/login/login_bloc.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel loginViewModel =
      ServiceLocator.instance.get<LoginViewModel>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
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
                  child: const Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
