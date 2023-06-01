import 'package:flutter/material.dart';
import 'package:flutter_random_project/features/auth/controller/auth_controller.dart';
import 'package:flutter_random_project/features/auth/pages/sign_in_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/enums.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'E-posta',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen boş bırakmayınız';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    hintText: 'E-posta',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Şifre',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen boş bırakmayınız';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    hintText: 'Şifre',
                  ),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Consumer(
                      builder: (context, ref, child) {
                        return MaterialButton(
                          color: Colors.blue,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String email = _emailController.text;

                              String password = _passwordController.text;
                              ref
                                  .watch(authControllerProvider)
                                  .createAccount(email, password)
                                  .then(
                                (value) {
                                  if (value == AuthResultStatus.successful) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const SignInPage(),
                                        ),
                                        (route) => false);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          value.name,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                          },
                          child: const Text('Kayıt Ol'),
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
