import 'package:drift/drift.dart';
import 'package:link_you_task/features/user/user_repo.dart';

import '../../db/database.dart';
import '../auth/domain/model/user_model.dart';

class UserRepoImpl extends UserRepo{
  AppDb db;
  UserRepoImpl(this.db);
  @override
  Future<void> addUser(UserModel userModel) async {
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
  @override
  Future<void> deleteUser() async {
    db.delete(db.userTable).go();
  }
  @override
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