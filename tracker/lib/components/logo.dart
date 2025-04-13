import 'package:flutter/material.dart';
import '../core/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF7B68EE), // Exact purple color from image
      body: Stack(
        children: [
          // Top-right circular gradient
          Positioned(
            top: -20,
            right: -20,
            child: Opacity(
              opacity: 0.15,
              child: Container(
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.25),
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ),

          // Bottom-left circular gradient
          Positioned(
            bottom: -20,
            left: -20,
            child: Opacity(
              opacity: 0.15,
              child: Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.2),
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ),

          // Main content column
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Empty space at top
                SizedBox(height: screenHeight * 0.3),

                // Logo directly embedded instead of using CipherXLogo widget
                Image.asset(
                  'assets/splash_screen/Vector.png',
                  height: 80,
                  width: 80,
                ),

                // Space between logo and text
                const SizedBox(height: 16),

                // CipherX text
                Text(
                  AppText.appName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),

                // Expanding space
                const Spacer(),

                // "By Open Source Community" text
                Column(
                  children: [
                    const Text(
                      'By',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Open Source ',
                          style: TextStyle(color: Colors.orange, fontSize: 14),
                        ),
                        Text(
                          'Community',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),

                // Space before progress indicator
                SizedBox(height: screenHeight * 0.03),

                // Bottom progress indicator
                Container(
                  width: screenWidth * 0.25,
                  height: 4,
                  margin: EdgeInsets.only(bottom: screenHeight * 0.025),
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
