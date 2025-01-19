import '../auth/domain/model/user_model.dart';

abstract class UserRepo{
  Future<void> addUser(UserModel userModel);
  Future<void> deleteUser();
  Future<UserModel?> getUser();
}