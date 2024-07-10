import 'package:mobx/mobx.dart';

import '../../models/todo.dart';

part 'todo_service.g.dart';

class TodoService = _TodoServiceBase with _$TodoService;

abstract class _TodoServiceBase with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @action
  void addTodo(String description) {
    todos.add(Todo(description: description));
  }

  @action
  void toggleTodoCompletion(Todo todo) {
    todo.completed = !todo.completed;
  }
}
