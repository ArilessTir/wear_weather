import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:wear_weather/presentation/common/look_card.dart';
import 'package:wear_weather/presentation/looks/screen/look_focus_page.dart';
import 'package:wear_weather/presentation/looks/widget/weather_card_look.dart';

class LookPage extends StatelessWidget {
  const LookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WeatherCardLook(),
              const SizedBox(height: 24),
              SizedBox(
                width: screenWidth,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 44, // Standard height for search bars
                        decoration: BoxDecoration(
                          color: Colors.grey[100], // Light grey background
                          borderRadius: BorderRadius.circular(
                              22), // Fully rounded corners
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Recherche un look',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 16,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    IconButton(
                      icon: const Icon(PhosphorIconsBold.slidersHorizontal),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true, // Allow the GridView to wrap its content
                physics:
                    const NeverScrollableScrollPhysics(), // Disable internal scrolling
                padding: const EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 164 / 220, // Width / Height
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const LookCard(destinationPage: LookFocusPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
