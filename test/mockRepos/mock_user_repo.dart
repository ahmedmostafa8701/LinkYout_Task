import 'package:link_you_task/features/auth/domain/model/user_model.dart';
import 'package:link_you_task/features/user/user_repo.dart';

class MockUserRepo extends UserRepo{
  UserModel ?userModel;
  @override
  Future<void> addUser(UserModel userModel) async{
    this.userModel = userModel;
  }

  @override
  Future<void> deleteUser() async{
    userModel = null;
  }

  @override
  Future<UserModel?> getUser() async{
    return userModel;
  }

}