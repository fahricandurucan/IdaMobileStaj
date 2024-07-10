import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_project/store/todo_store.dart';

import '../widgets/todo_item_widget.dart';

class TodoListPage extends StatelessWidget {
  final TodoStore _todoStore = GetIt.instance<TodoStore>();

  TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: _todoStore.todos.length,
          itemBuilder: (context, index) {
            final todo = _todoStore.todos[index];
            return TodoItemWidget(todo: todo);
          },
        ),
      ),
    );
  }
}
