import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Manuel bir hata tetikleme
                FirebaseCrashlytics.instance.crash();
              },
              child: const Text('Crash App'),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  throw Error();
                } catch (e, s) {
                  FirebaseCrashlytics.instance.recordError(e, s);
                }
              },
              child: const Text('Log Non-Fatal Error'),
            ),
          ],
        ),
      ),
    );
  }
}
