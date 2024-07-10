// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStoreBase, Store {
  Computed<ObservableList<Todo>>? _$todosComputed;

  @override
  ObservableList<Todo> get todos =>
      (_$todosComputed ??= Computed<ObservableList<Todo>>(() => super.todos,
              name: '_TodoStoreBase.todos'))
          .value;

  late final _$_TodoStoreBaseActionController =
      ActionController(name: '_TodoStoreBase', context: context);

  @override
  void addTodo(String description) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.addTodo');
    try {
      return super.addTodo(description);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTodoCompletion(Todo todo) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.toggleTodoCompletion');
    try {
      return super.toggleTodoCompletion(todo);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos}
    ''';
  }
}
