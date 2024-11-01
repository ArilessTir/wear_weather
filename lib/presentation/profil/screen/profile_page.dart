import 'package:flutter/material.dart';
import 'package:wear_weather/presentation/looks/screen/look_focus_page.dart';
import '../../common/look_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 40, // Image radius
                    backgroundImage: AssetImage('assets/images/Sofia.png'),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'sof.h_',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Je préfère le Soleil mais je vis à Lille ✨',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 97, 97, 97),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: [
                  Tab(text: "Mes looks"),
                  Tab(text: "Mes tableaux"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.all(2),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 164 / 220, // Width / Height
                      ),
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return const ArrayCard(
                          isLocked: true,
                          items: 12,
                          title: 'Title',
                          destinationPage: LookFocusPage(),
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 164 / 220, // Width / Height
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const LinkCard(
                            // isLocked: true,
                            // items: 12,
                            // title: 'Title',
                            destinationPage: LookFocusPage());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
