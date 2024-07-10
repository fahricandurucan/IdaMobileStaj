import 'package:get_it_project/service/todo_service.dart';
import 'package:mobx/mobx.dart';

import '../locator/service_locator.dart';
import '../models/todo.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;

abstract class _TodoStoreBase with Store {
  final TodoService _todoService = serviceLocator<TodoService>();

  @computed
  ObservableList<Todo> get todos => _todoService.todos;

  @action
  void addTodo(String description) {
    _todoService.addTodo(description);
  }

  @action
  void toggleTodoCompletion(Todo todo) {
    _todoService.toggleTodoCompletion(todo);
  }
}
