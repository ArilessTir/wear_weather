import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:wear_weather/core/widget/tab_save.dart';

import '../../core/widget/tag.dart';

class LookFocusPage extends StatelessWidget {
  const LookFocusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    void saveItem() {
      showModalBottomSheet(
        backgroundColor: const Color.fromRGBO(249, 245, 242, 1),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
            ),
            child: Container(
              color: const Color.fromRGBO(249, 245, 242, 1),
              height: MediaQuery.of(context).size.height / 1.2,
              child: const TabModalPage(),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(PhosphorIconsBold.caretLeft, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsBold.heart, color: Colors.white),
            onPressed: () {
              saveItem();
            },
          ),
          IconButton(
            icon: const Icon(PhosphorIconsBold.shareFat, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(PhosphorIconsBold.dotsThreeVertical,
                color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: screenHeight * 0.75,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/style2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '@username',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Tag(text: 'Ensoleillé'),
                          SizedBox(width: 8),
                          Tag(text: 'Chaud'),
                          SizedBox(width: 8),
                          Tag(text: 'Ville'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Shop le look",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 164 / 220,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/style1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                childCount: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
