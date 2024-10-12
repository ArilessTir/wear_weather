import 'package:flutter/material.dart';
import 'package:wear_weather/core/widget/generic_card.dart';
import 'package:wear_weather/core/widget/tedency_card.dart';
import 'package:wear_weather/core/widget/weather_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cardData = [
      {
        'title': 'Les tendances A/H 24 préférées de @lenamahfouf',
        'image': 'assets/images/style1.jpg', // Example image paths
      },
      {
        'title': 'Les tendances A/H 24 préférées de @carlaginola',
        'image': 'assets/images/style2.jpg',
      },
      {
        'title': 'Les tendances A/H 24 préférées de @maevademoura',
        'image': 'assets/images/style3.jpg',
      },
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(249, 245, 242, 1),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: SingleChildScrollView(
              // Makes the whole column scrollable
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Salut Sofia,',
                        style: TextStyle(
                          color: Color.fromRGBO(242, 136, 207, 1),
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        "C'est quoi le look du jour ?",
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const WeatherCard(),
                  const SizedBox(height: 24),
                  const GenericCard(
                    img: 'assets/images/Inspiration.png',
                    text: "Trouves des inspiration look",
                    width: double.infinity,
                  ),
                  const SizedBox(height: 24),

                  // The horizontal ListView
                  SizedBox(
                    height: 200, // Set a fixed height for the horizontal list
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cardData.length,
                        itemBuilder: (BuildContext context, int index) {
                          final cardItem =
                              cardData[index]; // Get the current map item
                          return TedencyCard(
                            title: cardItem['title']!,
                            img: cardItem['image']!,
                          );
                        }),
                  ),
                  const SizedBox(height: 24),
                  const GenericCard(
                    img: 'assets/images/data_analysis.jpg',
                    text: "Analyses les prochaines tendances",
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
