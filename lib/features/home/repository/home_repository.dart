import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user_model.dart';

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(
      auth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance),
);

class HomeRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;
  HomeRepository({
    required this.auth,
    required this.firebaseFirestore,
  });

  //Verileri kaydetme
  Future<void> saveUserInfo(UserModel userModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(userModel.toMap());
  }

  //Verileri getirme
  Future<UserModel> getUserInfo() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseFirestore
            .collection('users')
            .doc(auth.currentUser!.uid)
            .get();
    return UserModel.fromMap(documentSnapshot.data()!);
  }

  //Verileri güncelleme
  Future<void> updateUserInfo(UserModel userModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update(userModel.toMap());
  }

  //Verileri silme
  Future<void> deleteUserInfo() async {
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .delete();
  }
}
