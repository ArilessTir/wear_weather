import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:wear_weather/screens/home/home_page.dart';
import 'package:wear_weather/screens/login/login_page.dart';
import 'package:wear_weather/screens/look/look_page.dart';
import 'package:wear_weather/screens/profile/profile_page.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PersistentNav extends StatelessWidget {
  const PersistentNav({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const LoginPage(),
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            icon: const Icon(
              PhosphorIconsBold.cloudSun,
            ),
            title: "Meteo",
          ),
        ),
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            activeForegroundColor: Colors.black,
            icon: const Icon(
              PhosphorIconsBold.sparkle,
            ),
            title: "Accueil",
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
            icon: const Icon(
              PhosphorIconsBold.userCircle,
            ),
            activeForegroundColor: Colors.black,
            title: "Profil",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: const NavBarDecoration(color: Colors.transparent),
        ),
        navBarOverlap: const NavBarOverlap.full(),
      );
}
