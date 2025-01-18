class TodoModel {
  int id;
  String todo;
  bool completed;
  int userId;

  TodoModel({required this.id, required this.todo, required this.completed, required this.userId});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      todo: json['todo'] ?? '',
      completed: json['completed'] ?? false,
      userId: json['userId']
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'todo': todo,
      'completed': completed,
      'userId' : userId
    };
  }
}