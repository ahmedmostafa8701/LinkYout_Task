import 'package:dio/dio.dart';
import 'package:link_you_task/constant.dart';
import 'package:link_you_task/features/home/domain/home_page_repo.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';

class HomePageApi extends HomePageRepo{
  Dio dio;
  HomePageApi(this.dio);
  @override
  Future<List<TodoModel>> fetchPage({required int pageKey, int limit = pageSize}) async{
    var response = await dio.get('$BASE_URL${TODO_EndPoint}', queryParameters: {
      'skip': pageKey,
      'limit': limit
    });
    var todosJson = response.data['todos'] as List;
    return todosJson.map((todoJson) => TodoModel.fromJson(todoJson)).toList();
  }


}