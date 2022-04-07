import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_bloc_app/data/models/todo.dart';
import 'package:sample_bloc_app/data/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final Repository repository;

  TodosCubit({required this.repository}) : super(TodosInitial());

  void fetchTodos() {
    repository.fetchTodos().then((todos) {
      emit(TodosLoaded(todos));
    });
  }
}
