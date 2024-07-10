import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../models/todo.dart';
import '../store/todo_store.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  final TodoStore _todoStore = GetIt.instance<TodoStore>();

  TodoItemWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.description),
      trailing: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          _todoStore.toggleTodoCompletion(todo);
        },
      ),
    );
  }
}
