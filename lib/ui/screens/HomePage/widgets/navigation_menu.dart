import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swis_warehouse/ui/screens/HomePage/home_view.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/drawer_home.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/main_view.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/status_view.dart';
import 'package:swis_warehouse/ui/screens/MaterialPage/material_view.dart';

import '../../ProfilePage/profile_view.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final List<Widget> _pages = [
    const HomeView(),
    const diary(),
    const TransictionStatusScreen(),
    const Materials(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerHome(),
        // appBar: index == 3 ? null :_appbar(context),
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

  // AppBar _appbar(BuildContext context) {
  //   return AppBar(
  //     elevation: 0,
  //     leading: Builder(builder: (context) {
  //       return IconButton(
  //         onPressed: () {
  //           Scaffold.of(context).openDrawer();
  //         },
  //         icon: const Icon(
  //           Ionicons.menu_outline,
  //           color: Colors.brown ,
  //         ),
  //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
  //       );
  //     }),
  //     // actions: [
  //     //   // IconButton(
  //     //   //     onPressed: () {
  //     //   //       showSearch(context: context, delegate: CustomSearch());
  //     //   //     },
  //     //   //     icon: const Icon(
  //     //   //       Ionicons.search,
  //     //   //       color: Colors.brown,
  //     //   //     )),
  //     //   // IconButton(
  //     //   //     onPressed: () {},
  //     //   //     icon: const Icon(
  //     //   //       Ionicons.notifications,
  //     //   //       color: Colors.brown,
  //     //   //     )),
  //     // ],
  //   );
  // }

  GNav _navbar() {
    return GNav(
      onTabChange: _selectedPageIndex,
      gap: 1,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.028),
      backgroundColor: Colors.white,
      color: Colors.black54,
      activeColor: Colors.black,
      tabBackgroundColor: Colors.grey.shade200,
      tabBorderRadius: 20,
      iconSize: 27,
      textSize: 0,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'home',
        ),
        GButton(
          icon: Icons.near_me,
          text: 'send',
        ),
        GButton(icon: Icons.fire_truck_outlined, text: 'Status'),
        GButton(icon: Icons.warehouse, text: 'warehouse'),
        GButton(
          icon: Icons.person,
          text: 'profile',
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
