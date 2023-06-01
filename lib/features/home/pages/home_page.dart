import 'package:flutter/material.dart';
import 'package:flutter_random_project/features/auth/pages/sign_in_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controller/auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer(
          builder: (context, ref, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Merhaba!'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      ref.watch(authControllerProvider).logout().whenComplete(
                        () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignInPage(),
                              ),
                              (route) => false);
                        },
                      );
                    },
                    child: const Text(
                      'Çıkış Yap',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .watch(authControllerProvider)
                        .deleteAccount()
                        .whenComplete(
                      () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignInPage(),
                            ),
                            (route) => false);
                      },
                    );
                  },
                  child: const Text(
                    'Hesabı Sil',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
