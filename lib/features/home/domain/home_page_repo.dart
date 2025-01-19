import 'package:link_you_task/constant.dart';

import '../../todo/domain/model/todo_model.dart';

abstract class HomePageRepo{
  Future<List<TodoModel>> fetchPage({required int pageKey, int limit = pageSize});
}