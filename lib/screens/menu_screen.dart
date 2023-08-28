import 'package:flutter/material.dart';
import 'package:todo_app/screens/search_screen.dart';
import 'demande_de_collette.dart';
import 'liste_colis.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List menuList = [
    Colis(),
    DemandeDeColetteDeColis(),
  ];
  int current_fragment = 0;
  void changeFragment(index) {
    setState(() {
      current_fragment = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menuList[current_fragment],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        iconSize: 20,
        currentIndex: current_fragment,
        onTap: changeFragment,
        selectedItemColor: Colors.purple,
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Liste de mes colis"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), label: "Demande de collette"
          ),
        ],
      ),
    );
  }
}
