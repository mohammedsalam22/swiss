import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swis_warehouse/ui/screens/DiaryPage/diary.dart';
import 'package:swis_warehouse/ui/screens/HomePage/home_view.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/drawer_home.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/search_widget.dart';
import 'package:swis_warehouse/ui/screens/MaterialPage/material_view.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final List<Widget> _pages = [
    const HomeView(),
    const diary(),
    const Materials(),
    Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerHome(),
        appBar: _appbar(context),
        body: _pages[index],
        bottomNavigationBar: _navBarContainer());
  }

  Container _navBarContainer() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1),
            topRight: Radius.circular(1),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: _navbar(),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      }),
      actions: [
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              color: Colors.grey,
            )),
      ],
    );
  }

  GNav _navbar() {
    return GNav(
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
        GButton(icon: Icons.warehouse, text: 'warehouse'),
        GButton(
          icon: Icons.receipt_long,
          text: 'new',
        ),
      ],
    );
  }

  int index = 0;

  void _selectedPageIndex(int value) {
    setState(() {
      index = value;
    });
  }
}
