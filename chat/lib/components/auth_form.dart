import 'package:flutter/material.dart';

import '../models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  final bool isLoading;

  const AuthForm({super.key, required this.onSubmit, required this.isLoading});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _authFormData = AuthFormData();
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    widget.onSubmit(_authFormData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  child: _authFormData.isSignup
                      ? TextFormField(
                          key: ValueKey('name'),
                          initialValue: _authFormData.name,
                          onChanged: (name) => _authFormData.name = name,
                          decoration: InputDecoration(label: Text('Nome')),
                          validator: (value) {
                            final name = value ?? '';
                            if (name.trim().length < 5) {
                              return 'Nome deve ter no mínimo 5 caracteres';
                            }
                            return null;
                          },
                        )
                      : const SizedBox.shrink(),
                ),
                TextFormField(
                  key: ValueKey('email'),
                  initialValue: _authFormData.email,
                  onChanged: (email) => _authFormData.email = email,
                  decoration: InputDecoration(label: Text('E-mail')),
                  validator: (value) {
                    final email = value ?? '';
                    if (!email.contains('@')) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  key: ValueKey('password'),
                  initialValue: _authFormData.password,
                  onChanged: (password) => _authFormData.password = password,
                  obscureText: true,
                  decoration: InputDecoration(label: Text('Senha')),
                  validator: (value) {
                    final password = value ?? '';
                    if (password.length < 6) {
                      return 'Senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                widget.isLoading
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.onPrimary,
                            ),
                            child: Text(
                              _authFormData.isLogin ? 'Entrar' : 'Cadastrar',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _authFormData.toggleAuthMode();
                              });
                            },
                            child: Text(
                              _authFormData.isLogin
                                  ? 'Criar uma nova conta?'
                                  : 'Já possui uma conta?',
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
