import 'package:sample_bloc_app/data/network_service.dart';

import 'models/todo.dart';

class Repository {
  final NetworkService networkService;

  Repository(this.networkService);

  Future<List<Todo>> fetchTodos() async {
    final todosResponse = await networkService.fetchTodos();
    return todosResponse.map((e) => Todo.fromJson(e)).toList();
  }
}
