import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swis_warehouse/ui/screens/HomePage/home_view.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final List<Widget> _pages = [
    const HomeView(),
    Scaffold(
      body: Container(
        color: Colors.red,
      ),
    ),
    Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[index],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: GNav(
              onTabChange: _selectedPageIndex,
              gap: 5,
              padding: const EdgeInsets.all(15),
              backgroundColor: Colors.white,
              color: Colors.red,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.red,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'home',
                ),
                GButton(
                  icon: Icons.near_me,
                  text: 'send',
                ),
                GButton(icon: Icons.real_estate_agent, text: 'recieve'),
                GButton(
                  icon: Icons.receipt_long,
                  text: 'new',
                ),
              ],
            ),
          ),
        ));
  }

  int index = 0;

  void _selectedPageIndex(int value) {
    setState(() {
      index = value;
    });
  }
}
