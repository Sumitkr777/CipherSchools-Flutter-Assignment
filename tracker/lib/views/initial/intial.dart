import 'dart:async';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../core/utils/constants.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to splash screen after 5 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.splash);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7B68EE), // Purple background
      body: Stack(
        children: [
          // Top-right circular gradient
          Positioned(
            top: 0,
            right: 0,
            child: Transform.rotate(
              angle: 3.14159 / 1,
              child: Image.asset(
                'assets/splash_screen/recordcircle.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ),

          // Bottom-left circular gradient
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/splash_screen/recordcircle.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),

          // Center content (logo and name)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CipherX Logo
                Image.asset(
                  'assets/splash_screen/Vector.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 16),
                // CipherX Text
                Image.asset('assets/splash_screen/CipherX.png', height: 32),
              ],
            ),
          ),

          // Bottom text and progress bar
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  AppText.by,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      AppText.openSource,
                      style: TextStyle(
                        color: Color.fromARGB(231, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      AppText.community,
                      style: TextStyle(color: Color(0xFFFF9800), fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Progress bar
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
