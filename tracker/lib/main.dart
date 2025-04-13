import 'package:flutter/material.dart';
import 'views/splash/splash_screen.dart';
// optional if you use named routes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CipherX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'YourCustomFont', // Optional: if you're using custom fonts
      ),
      home: const SplashScreen(), // Start with the splash screen
    );
  }
}
