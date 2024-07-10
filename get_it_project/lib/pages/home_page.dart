import 'package:flutter/material.dart';
import 'package:get_it_project/pages/add_todo_page.dart';
import 'package:get_it_project/pages/todo_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not App"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoPage()));
            },
            child: const Text('Add To-Do'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TodoListPage()));
            },
            child: const Text('View To-Do List'),
          ),
        ]),
      ),
    );
  }
}
