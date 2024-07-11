import 'package:auto_route/auto_route.dart';
import 'package:auto_route_test/router/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("SPLASH PAGE"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // router.push(const HomeRoute());
                  router.replace(const HomeRoute()); // geri gelemez splash e
                },
                child: const Text("Go to HomePage"))
          ],
        ),
      ),
    );
  }
}
