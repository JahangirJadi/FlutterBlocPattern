class Todo {
  String title;
  bool completed;
  int id;
  int userId;

  Todo.fromJson(Map json)
      : title = json["title"],
        completed = json["completed"],
        userId = json["userId"] as int,
        id = json["id"] as int;
}
