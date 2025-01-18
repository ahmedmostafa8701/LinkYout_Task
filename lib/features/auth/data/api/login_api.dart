import 'package:dio/dio.dart';
import 'package:link_you_task/constant.dart';
import 'package:link_you_task/features/auth/domain/model/user_model.dart';

import '../../domain/repo/login_repo.dart';

class LoginApi extends LoginRepo {
  LoginApi(this.dio);

  Dio dio;

  @override
  Future<UserModel?> login(String username, String password) async {
    var response = await dio.post('$BASE_URL${LOGIN_EndPoint}', data: {
      'username': username,
      'password': password,
    });
    if(response.statusCode != 200){
      return null;
    }
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }
}
