import 'package:flutter/material.dart';

class WeatherMetrics extends StatelessWidget {
  final String icon;
  final String text;
  final Color iconColor;
  const WeatherMetrics(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          size: 25,
          AssetImage(icon),
          color: iconColor,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
