import 'package:flutter/material.dart';

void main() {
  runApp(const MyLoveApp());
}

class MyLoveApp extends StatelessWidget {
  const MyLoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'For My Love ❤️',
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      home: const LovePage(),
    );
  }
}

class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF9AA2),
              Color(0xFFFFC3A0),
              Color(0xFFFFD5E5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Здоров сладуля ❤️",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Ееееее ну цейвово...\n\n"
                  "Я скучив трохи...\n"
                  "Ну добре не трохи\n\n"
                  "Люблю тебе пупс 💕",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 240),
                const Text(
                  "Покусаю тебе скоро❤️",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}