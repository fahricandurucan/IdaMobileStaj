import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../mobx/counter_model.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobx"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => Text(counterModel.counter.toString()),
            ),
            ElevatedButton(
                onPressed: () {
                  counterModel.incrementCounter();
                },
                child: const Text("Arttır")),
            ElevatedButton(
                onPressed: () {
                  counterModel.decrementCounter();
                },
                child: const Text("Azalt")),
          ],
        ),
      ),
    );
  }
}
