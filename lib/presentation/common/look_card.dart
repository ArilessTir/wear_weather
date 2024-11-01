import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseCard extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final String backgroundImage;
  const BaseCard(
      {super.key, this.child, this.onTap, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164,
      height: 220,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class LookCard extends StatelessWidget {
  final Widget destinationPage;
  const LookCard({super.key, required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destinationPage,
          ),
        );
      },
      backgroundImage: 'assets/images/style2.jpg',
    );
  }
}

class ArrayCard extends StatelessWidget {
  final Widget destinationPage;
  final bool isLocked;
  final int items;
  final String title;
  const ArrayCard(
      {super.key,
      required this.isLocked,
      required this.items,
      required this.title,
      required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destinationPage,
          ),
        );
      },
      backgroundImage: "assets/images/style1.jpg",
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLocked
                ? const Icon(
                    PhosphorIconsFill.lock,
                    color: Colors.white,
                    size: 20,
                  )
                : const Icon(
                    PhosphorIconsFill.lock,
                    color: Colors.transparent,
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$items',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LinkCard extends StatelessWidget {
  final Widget destinationPage;
  const LinkCard({super.key, required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: () {
        launchUrl(Uri.parse('https://pinterest.com/'));
      },
      backgroundImage: "assets/images/style1.jpg",
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'Marque',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Acheter",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Icon(
                    PhosphorIconsFill.arrowUpRight,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
