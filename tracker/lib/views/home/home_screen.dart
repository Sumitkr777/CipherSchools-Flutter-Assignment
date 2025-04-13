import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            height: size.height,
            width: size.width,
            color: const Color(0xFF8B6FF3), // purple background
          ),

          // Top left Vector swirl
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

          // Top left CipherX logo
          Positioned(
            top: 60,
            left: 24,
            child: Image.asset(
              'assets/splash_screen/Vector.png',
              width: 80,
              height: 80,
            ),
          ),

          // Bottom swirl background
          Positioned(
            bottom: -30,
            left: -30,
            child: Image.asset(
              'assets/splash_screen/recordcircle.png',
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),

          // Center bottom content
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome to",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'ABeeZee-Regular',
                  ),
                ),
                const SizedBox(height: 4),
                Image.asset('assets/splash_screen/CipherX.png', width: 160),
                const SizedBox(height: 8),
                const Text(
                  "The best way to track your expenses.",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          // Forward arrow button
          Positioned(
            bottom: 50,
            right: 24,
            child: InkWell(
              onTap: () {
                // Navigate to next screen
              },
              borderRadius: BorderRadius.circular(40),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward,
                    size: 32,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
