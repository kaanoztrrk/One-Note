import 'package:one_note/data/src/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<UserModel> signUp(UserModel userModel, String password);

  Future<void> setUserData(UserModel userModel);

  Future<void> signIn(String email, password);

  Future<void> logOut();
}
