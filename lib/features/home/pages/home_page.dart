import 'package:flutter/material.dart';
import 'package:flutter_random_project/features/auth/controller/auth_controller.dart';
import 'package:flutter_random_project/features/home/controller/home_controller.dart';
import 'package:flutter_random_project/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profil'),
            actions: [
              IconButton(
                onPressed: () {
                  ref.read(authControllerProvider).logout();
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lütfen adınızı giriniz';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Ad',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _surnameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lütfen soyadınızı giriniz';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Soyad',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lütfen telefon numaranızı giriniz';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Telefon Numarası',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _ageController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lütfen yaşınızı giriniz';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Yaş',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.indigo[200],
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          UserModel userModel = UserModel(
                            age: int.parse(_ageController.text),
                            name: _nameController.text,
                            surname: _surnameController.text,
                            phoneNumber: _phoneController.text,
                          );
                          ref
                              .read(homeControllerProvider)
                              .saveUserInfo(userModel);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Kaydet'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
