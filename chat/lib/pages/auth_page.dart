import 'package:chat/components/auth_form.dart';
import 'package:chat/core/models/auth_form_data.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);

      if (formData.isLogin) {
        await AuthService().login(
          email: formData.email,
          password: formData.password,
        );
      } else {
        await AuthService().signUp(
          email: formData.email,
          password: formData.password,
          name: formData.name,
          image: formData.image,
        );
      }
    } catch (error) {
      // tratar erro!
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit: _handleSubmit, isLoading: _isLoading),
            ),
          ),
        ],
      ),
    );
  }
}
