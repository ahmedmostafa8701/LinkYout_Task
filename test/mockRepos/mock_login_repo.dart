import 'package:link_you_task/features/auth/domain/model/user_model.dart';
import 'package:link_you_task/features/auth/domain/repo/login_repo.dart';

class MockLoginRepo extends LoginRepo{
  List<UserModel> users = [
    UserModel(id: 1),
    UserModel(id: 2),
    UserModel(id: 3),
    UserModel(id: 4),
  ];
  Map<List<String>, UserModel> userMap = {
    ['user1', 'password1']: UserModel(id: 1),
    ['user2', 'password2']: UserModel(id: 2),
    ['user3', 'password3']: UserModel(id: 3),
    ['user4', 'password4']: UserModel(id: 4),
  };
  @override
  Future<UserModel?> login(String username, String password) async{
    try{
      return userMap.entries
          .firstWhere((element) =>
              element.key[0] == username && element.key[1] == password)
          .value;
    }catch(e){
      return null;
    }
  }

}