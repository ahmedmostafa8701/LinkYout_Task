import 'package:drift/drift.dart';

class UserTable extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get username => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get accessToken => text().nullable()();
  TextColumn get refreshToken => text().nullable()();
}