import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:wear_weather/screens/home/home_page.dart';
import 'package:wear_weather/screens/login/login_page.dart';
import 'package:wear_weather/screens/look/look_page.dart';
import 'package:wear_weather/screens/profile/profile_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PersistentNav extends StatefulWidget {
  const PersistentNav({super.key});

  @override
  _PersistentNavState createState() => _PersistentNavState();
}

class _PersistentNavState extends State<PersistentNav> {
  // Set initialIndex to 1 to make HomePage the main page
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  void showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Créer",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Color.fromARGB(34, 0, 0, 0),
                ),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(PhosphorIconsFill.coatHanger),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Un look',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      ImageIcon(
                        size: 25,
                        AssetImage(
                          "assets/icons/nav_tab.png",
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Un tableau',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            inactiveBackgroundColor: Colors.white,
            icon: Icon(
              _controller.index == 0
                  ? PhosphorIconsFill.house
                  : PhosphorIconsBold.house,
            ),
            title: "Accueil",
          ),
        ),
        PersistentTabConfig(
          screen: const LoginPage(),
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            inactiveBackgroundColor: Colors.white,
            icon: Icon(
              _controller.index == 1
                  ? PhosphorIconsFill.cloudSun // Filled icon when active
                  : PhosphorIconsBold.cloudSun, // Regular icon when inactive
            ),
            title: "Meteo",
          ),
        ),
        PersistentTabConfig.noScreen(
          onPressed: (BuildContext context) {
            return showBottomModal(context);
          },
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            icon: Icon(
              _controller.index == 2
                  ? PhosphorIconsFill.plus
                  : PhosphorIconsBold.plus,
            ),
            title: "Créer",
          ),
        ),
        PersistentTabConfig(
          screen: const LookPage(),
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            icon: const ImageIcon(
              size: 25,
              AssetImage(
                "assets/icons/nav_tab.png",
              ),
            ),
            title: "Looks",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfilePage(),
          item: ItemConfig(
            icon: Icon(
              _controller.index == 3
                  ? PhosphorIconsFill.userCircle
                  : PhosphorIconsBold.userCircle,
            ),
            activeForegroundColor: Colors.black,
            title: "Profil",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        controller: _controller,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: const NavBarDecoration(color: Colors.transparent),
        ),
        navBarOverlap: const NavBarOverlap.full(),
      );
}
