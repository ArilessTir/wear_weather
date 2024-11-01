import 'package:flutter/material.dart';
import 'package:wear_weather/presentation/common/weather_metrics.dart';

class WeatherCardLook extends StatelessWidget {
  const WeatherCardLook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Adding white background to make shadow visible
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Temperature and Location
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '21°',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LILLE - FR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '29.09',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Dropdown icon
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
          const SizedBox(height: 8),
          // Weather description
          const WeatherMetrics(
              icon: 'assets/icons/Weathersun.png',
              text: 'Ensoleillé et Chaud',
              iconColor: Color.fromRGBO(255, 131, 81, 1)),
          const SizedBox(height: 8),
          // Weather metrics
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const WeatherMetrics(
                icon: 'assets/icons/Weathersun.png',
                text: '8',
                iconColor: Color.fromRGBO(212, 135, 105, 1),
              ),
              const WeatherMetrics(
                  icon: 'assets/icons/humidite.png',
                  text: '12%',
                  iconColor: Colors.blue),
              const WeatherMetrics(
                  icon: 'assets/icons/Weather.png',
                  text: '30%',
                  iconColor: Colors.blue),
              const WeatherMetrics(
                  icon: 'assets/icons/vent.png',
                  text: '30km/h',
                  iconColor: Colors.blue),
              Icon(Icons.info_outline, color: Colors.grey[400], size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
