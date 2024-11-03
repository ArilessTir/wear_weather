import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  const BlurredContainer(
      {super.key,
      required this.color,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.7),
            color.withOpacity(0.3),
          ],
          stops: const [0.2, 1.0],
        ),
        borderRadius: BorderRadius.circular(height),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 60,
          sigmaY: 60,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}
