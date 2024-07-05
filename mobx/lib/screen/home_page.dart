import 'package:flutter/material.dart';
import 'package:mobx/screen/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const SecondPage()));
                },
                child: const Text("Second Page"))
          ],
        ),
      ),
    );
  }
}
