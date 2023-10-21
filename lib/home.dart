import 'package:flutter/material.dart';
import 'itineraire.dart';
import 'notification.dart';
import 'info.dart';
import 'parametre.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    const ItinerairePage(),
    const NotificationsPage(),
    const HomePage(),
    const InfoPage(),
    const ParametrePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logoo.png',
                    width: 100,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "PISCHOOL",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentPageIndex], // Affiche la page en fonction de l'index
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        currentIndex: _currentPageIndex,
        onTap: _onItemTapped, // Appelle la fonction au clic sur un élément
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation_outlined),
            label: 'Itinéraire',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.toc_rounded),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}
