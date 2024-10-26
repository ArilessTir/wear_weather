import 'package:flutter/material.dart';

class TabModalPage extends StatefulWidget {
  const TabModalPage({super.key});

  @override
  _TabModalPageState createState() => _TabModalPageState();
}

class _TabModalPageState extends State<TabModalPage> {
  int _currentPage = 0; // Track the current page index

  void _goToPage(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 242, 1),
      body: _currentPage == 0 ? _firstPageContent() : _secondPageContent(),
    );
  }

  Widget _firstPageContent() {
    return Container(
      color: const Color.fromRGBO(249, 245, 242, 1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/style2.jpg',
                  width: 80,
                  height: 100,
                ),
                const Text(
                  "Look enregistré",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                "Vos Tableaux",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  _goToPage(1); // Navigate to the second page
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                child: const Text(
                  'Créer tableau',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Crée ton premier tableau pour enregistrer ce look ✨",
              style: TextStyle(
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _secondPageContent() {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 242, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _goToPage(0); // Go back to the first page
          },
        ),
        title: const Text(
          "Nouveau Tableau",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {},
            child: const Text('Créer'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align the row to start from the top
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align the Expanded widget with the top of the image
                children: [
                  Image.asset(
                    'assets/images/style2.jpg',
                    width: 120,
                    height: 160,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align content within the column to start from the top
                      children: [
                        Text("Nom"),
                        SizedBox(height: 8), // Add some spacing if necessary
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            hintText: "Ex: Été ensoleillé",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(color: Color.fromARGB(41, 0, 0, 0)),
              ),
              const Text("Selectionne les tags associés au tableau"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Ensoleillé'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text('Chaud'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text('Vacance'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text('Jour'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text('Nuit'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
