import 'package:drift/drift.dart';
import 'package:link_you_task/db/database.dart';
import 'package:link_you_task/db/user_table.dart';

import '../auth/domain/model/user_model.dart';

class UserRepo{
  var db = AppDb();
  Future<void> AddUser(UserModel userModel) async {
    db.into(db.userTable).insert(
      UserTableCompanion(
        id: Value(userModel.id),
        username: Value(userModel.username),
        email: Value(userModel.email),
        firstName: Value(userModel.firstName),
        lastName: Value(userModel.lastName),
        image: Value(userModel.image),
        accessToken: Value(userModel.accessToken),
        refreshToken: Value(userModel.refreshToken),
        gender: Value(userModel.gender),
      )
    );
  }
  Future<void> deleteUser() async {
    db.delete(db.userTable).go();
  }
  Future<UserModel?> getUser() async {
    var user = await db.select(db.userTable).getSingleOrNull();
    if(user == null){
      return null;
    }
    return UserModel(
      id: user.id,
      username: user.username,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      image: user.image,
      accessToken: user.accessToken,
      refreshToken: user.refreshToken);
  }
}