import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_app/constants/strings.dart';
import 'package:sample_bloc_app/cubit/todos_cubit.dart';
import 'package:sample_bloc_app/data/models/todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state is! TodosLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          final todosList = (state).todos;

          return SingleChildScrollView(
            child: Column(
              children: todosList.map((e) => _todo(e)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _todo(Todo todo) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            todo.title,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
