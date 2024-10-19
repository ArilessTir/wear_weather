import 'package:flutter/material.dart';
import 'package:wear_weather/core/widget/persistent_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(249, 245, 242, 1),
        useMaterial3: true,
      ),
      home: const PersistentNav(),
    );
  }
}
