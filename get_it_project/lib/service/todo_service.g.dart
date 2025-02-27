// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoService on _TodoServiceBase, Store {
  late final _$todosAtom =
      Atom(name: '_TodoServiceBase.todos', context: context);

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$_TodoServiceBaseActionController =
      ActionController(name: '_TodoServiceBase', context: context);

  @override
  void addTodo(String description) {
    final _$actionInfo = _$_TodoServiceBaseActionController.startAction(
        name: '_TodoServiceBase.addTodo');
    try {
      return super.addTodo(description);
    } finally {
      _$_TodoServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTodoCompletion(Todo todo) {
    final _$actionInfo = _$_TodoServiceBaseActionController.startAction(
        name: '_TodoServiceBase.toggleTodoCompletion');
    try {
      return super.toggleTodoCompletion(todo);
    } finally {
      _$_TodoServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos}
    ''';
  }
}
