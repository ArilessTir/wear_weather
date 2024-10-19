import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(28),
          bottomRight: Radius.circular(28),
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Row(
              children: [
                ImageIcon(
                  size: 25,
                  AssetImage("assets/icons/location.png"),
                ),
                Text(
                  'Lille,FR',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Text(
                  'Auj, 1er Oct. 12:04',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text(
                  '21°',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          size: 25,
                          AssetImage("assets/icons/Weathersun.png"),
                          color: Color.fromRGBO(255, 131, 81, 1),
                        ),
                        Text(
                          'Ensoleillé',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          size: 20,
                        ),
                        Text(
                          '15°',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_upward,
                          size: 20,
                        ),
                        Text(
                          '21°',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color.fromRGBO(252, 228, 244, 1),
                  )),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            size: 25,
                            AssetImage("assets/icons/Weathersun.png"),
                            color: Color.fromRGBO(255, 131, 81, 1),
                          ),
                          Text(
                            '8',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Indice 50 conseillé",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 15,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                    color: Color.fromRGBO(252, 228, 244, 1),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            size: 25,
                            AssetImage("assets/icons/humidite.png"),
                            color: Colors.blue,
                          ),
                          Text(
                            '30 %',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Risque de pluie faible",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 15,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                    color: Color.fromRGBO(252, 228, 244, 1),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            size: 25,
                            AssetImage("assets/icons/vent.png"),
                            color: Colors.purple,
                          ),
                          Text(
                            '30km/h',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Vent faible",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
