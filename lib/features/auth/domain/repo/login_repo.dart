import 'package:link_you_task/features/auth/domain/model/user_model.dart';

abstract class LoginRepo{
  Future<UserModel?> login(String username, String password);
}