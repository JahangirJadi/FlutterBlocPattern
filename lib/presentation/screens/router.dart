import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_app/constants/strings.dart';
import 'package:sample_bloc_app/cubit/todos_cubit.dart';
import 'package:sample_bloc_app/data/network_service.dart';
import 'package:sample_bloc_app/data/repository.dart';
import 'package:sample_bloc_app/presentation/screens/add_todo_screen.dart';
import 'package:sample_bloc_app/presentation/screens/edit_todo_screen.dart';
import 'package:sample_bloc_app/presentation/screens/todo_screen.dart';

class AppRouter {
  late Repository repository;

  AppRouter() {
    repository = Repository(NetworkService());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      TodosCubit(repository: repository),
                  child: TodoScreen(),
                ));

      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (contexst) => EditTodoScreen());

      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (context) => AddTodoScreen());

      default:
        return null;
    }
  }
}
