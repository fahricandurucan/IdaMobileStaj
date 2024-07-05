import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobx"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("0"),
            ElevatedButton(onPressed: () {}, child: const Text("Arttır")),
            ElevatedButton(onPressed: () {}, child: const Text("Azalt")),
          ],
        ),
      ),
    );
  }
}
