import 'package:flutter/material.dart';
import 'routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Andriiana SMM Portfolio',
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      routerConfig: AppRouter,
    );
  }
}