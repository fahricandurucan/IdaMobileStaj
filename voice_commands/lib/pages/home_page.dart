import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer player = AudioPlayer();

  Future<void> playSound() async {
    if (kIsWeb) {
      // Web platformu çalışırken
      print("Web platformunda çalıştırıldı");
      try {
        // uri.base kullandık
        final url = '${Uri.base}assets/voice1.mp3';
        await player.setUrl(url); // load
        await player.play();
      } catch (e) {
        print("Error loading or playing sound: $e");
      }
    } else {
      // Mobil(tablet) platformu çalışırken
      print("Mobile platformunda çalıştırıldı");
      try {
        await player.setAsset('assets/voice1.mp3'); //load
        await player.play();
      } catch (e) {
        print("Error loading or playing sound: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voice Commands"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  playSound();
                },
                child: const Text("Voice"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
