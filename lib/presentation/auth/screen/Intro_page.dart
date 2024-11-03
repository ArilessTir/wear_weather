import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wear_weather/presentation/auth/screen/signin_page.dart';
import 'dart:math' as math;

import 'package:wear_weather/presentation/common/long_button.dart';

import '../widget/blurred_container.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Animated gradient background
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Stack(
                children: [
                  // First blob
                  Positioned(
                    left: screenWidth * 0.4 +
                        math.sin(_animationController.value * 2 * math.pi) *
                            100,
                    top: screenHeight * 0.3 +
                        math.cos(_animationController.value * 2 * math.pi) *
                            100,
                    child: BlurredContainer(
                      color: const Color.fromRGBO(253, 223, 175, 1),
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.8,
                    ),
                  ),
                  // Second blob
                  Positioned(
                    right: screenWidth * 0.4 +
                        math.cos(_animationController.value * 2 * math.pi) *
                            100,
                    bottom: screenHeight * 0.3 +
                        math.sin(_animationController.value * 2 * math.pi) *
                            100,
                    child: BlurredContainer(
                      color: const Color.fromRGBO(201, 167, 214, 1),
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.6,
                    ),
                  ),
                  // Third blob
                  Positioned(
                    left: screenWidth * 0.3 +
                        math.sin(_animationController.value * 2 * math.pi + 1) *
                            100,
                    top: screenHeight * 0.5 +
                        math.cos(_animationController.value * 2 * math.pi + 1) *
                            100,
                    child: BlurredContainer(
                      color: Color.fromARGB(247, 182, 143, 225),
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.6,
                    ),
                  ),
                ],
              );
            },
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  // Logo section with Expanded to take available space
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: screenWidth * 0.35,
                        height: screenWidth * 0.35,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Bottom section
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Bienvenue sur\nWear Weather',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.12,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Vous ne savez pas quoi porter aujourd'hui ?\nTrouvez la tenue parfaite en fonction de la\nmétéo !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: LongButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SigninPage()),
                            );
                          },
                          text: 'Commencer',
                        ),
                      ),
                    ],
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
