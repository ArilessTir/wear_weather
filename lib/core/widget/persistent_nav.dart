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
      PersistentTabController(initialIndex: 1);

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const LoginPage(),
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            inactiveBackgroundColor: Colors.white,
            icon: Icon(
              _controller.index == 0
                  ? PhosphorIconsFill.cloudSun // Filled icon when active
                  : PhosphorIconsBold.cloudSun, // Regular icon when inactive
            ),
            title: "Meteo",
          ),
        ),
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            inactiveBackgroundColor: Colors.white,
            icon: Icon(
              _controller.index == 1
                  ? PhosphorIconsFill.sparkle
                  : PhosphorIconsBold.sparkle,
            ),
            title: "Accueil",
          ),
        ),
        PersistentTabConfig(
          screen: const LookPage(),
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            icon: ImageIcon(
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
