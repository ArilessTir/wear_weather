import 'package:flutter/material.dart';
import 'package:wear_weather/core/themes/app_theme.dart';
import 'package:wear_weather/presentation/common/persistent_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear Weather',
      theme: appTheme(),
      home: const PersistentNavbar(),
    );
  }
}
