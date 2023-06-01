import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_random_project/features/auth/repository/auth_repository.dart';

import '../../../common/enums.dart';

final authControllerProvider = Provider(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository: authRepository);
  },
);

class AuthController {
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository,
  });

  Future<AuthResultStatus> createAccount(email, password) async {
    return await authRepository.createAccount(email, password);
  }

  Future<AuthResultStatus> login(email, password) async {
    return await authRepository.login(email, password);
  }

  Future<void> sendForgotPasswordEmail(email) async {
    return await authRepository.sendForgotPasswordEmail(email);
  }

  Future<void> logout() async {
    return await authRepository.logout();
  }

  Future<void> deleteAccount() async {
    return await authRepository.deleteAccount();
  }
}
