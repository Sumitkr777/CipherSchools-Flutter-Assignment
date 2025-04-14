import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF7B68EE), // Purple color
      body: Stack(
        children: [
          // Top-right circular gradient image - rotated
          Positioned(
            top: 0,
            right: 0,
            child: Transform.rotate(
              angle: 3.14159 / 1,
              child: Image.asset(
                'assets/splash_screen/recordcircle.png',
                width: screenWidth * 0.5,
              ),
            ),
          ),

          // Bottom-left circular gradient image
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/splash_screen/recordcircle.png',
              width: screenWidth * 0.5,
            ),
          ),

          // Center logo, app name and button
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/splash_screen/Vector.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 16),
                Image.asset('assets/splash_screen/CipherX.png', height: 32),
                const SizedBox(height: 24),
                const Text(
                  'The best way to track your expenses.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 48),
                // Get Started Button
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF7B68EE),
                    ),
                    // Navigate directly to signup screen
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.signup,
                    ),
                  ),
                ),
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
                Container(
                  width: screenWidth * 0.25,
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
