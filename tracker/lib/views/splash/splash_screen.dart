import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7B68EE),
      body: Stack(
        children: [
          // Top-right circular gradient
          Positioned(
            top: -MediaQuery.of(context).size.width * 0.2,
            right: -MediaQuery.of(context).size.width * 0.2,
            child: Transform.rotate(
              angle: 3.14159 / 1,
              child: Image.asset(
                'assets/splash_screen/recordcircle.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),

          // Bottom-left circular gradient
          Positioned(
            bottom: -MediaQuery.of(context).size.width * 0.2,
            left: -MediaQuery.of(context).size.width * 0.2,
            child: Image.asset(
              'assets/splash_screen/recordcircle.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Top logo
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Image.asset(
                      'assets/splash_screen/Vector.png',
                      height: 80,
                      width: 80,
                    ),
                  ),

                  const Spacer(),

                  // Text and button directly in one row with button aligned next to text
                  Container(
                    margin: const EdgeInsets.only(bottom: 50.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Welcome to',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: 'ABeeZee',
                                  fontWeight: FontWeight.w400,
                                  height: 1.1,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'CipherX.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontFamily: 'BrunoAceSC',
                                  fontWeight: FontWeight.w400,
                                  height: 1.1,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'The best way to track your expenses.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'ABeeZee',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // No spacing between text and button
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap:
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.signup,
                                ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
