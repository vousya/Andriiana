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
                  "Hi My Love ❤️",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "This little website is just for you.\n\n"
                  "Every line of code was written with love.\n"
                  "Every pixel on this page reminds me how lucky I am.\n\n"
                  "Thank you for being my happiness, my peace, and my forever. 💕",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "I love you more than all the bugs in my code 😄❤️",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
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