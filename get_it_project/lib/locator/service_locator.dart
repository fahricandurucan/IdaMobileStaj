import 'package:get_it/get_it.dart';
import 'package:get_it_project/service/todo_service.dart';

final GetIt serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator.registerLazySingleton(() => TodoService());
}
