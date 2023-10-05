
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user_model.dart';
import '../repository/home_repository.dart';

final homeControllerProvider = Provider<HomeController>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return HomeController(homeRepository: homeRepository);
});

class HomeController {
  final HomeRepository homeRepository;
  HomeController({
    required this.homeRepository,
  });

  Future<void> saveUserInfo(UserModel userModel) async {
    await homeRepository.saveUserInfo(userModel);
  }

  Future<UserModel> getUserInfo() async {
    return await homeRepository.getUserInfo();
  }

  Future<void> updateUserInfo(UserModel userModel) async {
    await homeRepository.updateUserInfo(userModel);
  }

  Future<void> deleteUserInfo() async {
    await homeRepository.deleteUserInfo();
  }

}
