import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:swis_warehouse/ui/screens/HomePage/home_view.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/drawer_home.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/main_view.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/status_view.dart';
import 'package:swis_warehouse/ui/screens/MaterialPage/material_view.dart';
import 'package:swis_warehouse/ui/shared_widgets/logout.dart';
import '../../LabelPage/sending_label/donor_view.dart';
import '../../LabelStatus/donorstatus_view.dart';
import '../../ProfilePage/profile_view.dart';
import '../view.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int type = 2; // Default value
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _loadUserType(); // Load user type from SharedPreferences
  }

  Future<void> _loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = prefs.getInt('type') ?? 2;
      _initializePages(); // Initialize pages based on userType
    });
  }

  void _initializePages() {
    if (type == 2) {
      _pages = [
         WarehouseView(),
        const diary(),
        const TransictionStatusScreen(),
        const Materials(),
        ProfilePage(),
      ];
    } else if (type == 3) {
      _pages = [
        const DonorTransictionStatus(),
        const CreateDonorTransiction(),
        LogoutButton(),
        ProfilePage()
      ];
    } else {
    print('an error occurred');
    }
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerHome(),
      body: _pages[index],
      bottomNavigationBar: _navBarContainer(),
    );
  }

  Container _navBarContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(1),
          topRight: Radius.circular(1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: _navbar(),
      ),
    );
  }

  GNav _navbar() {
    if (type == 2) {
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
            text: 'Home',
          ),
          GButton(
            icon: Icons.near_me,
            text: 'Send',
          ),
          GButton(icon: Icons.fire_truck_outlined, text: 'Status'),
          GButton(icon: Icons.warehouse, text: 'Warehouse'),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      );
    } else if (type == 3) {
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
            icon: Icons.assignment_turned_in,
            text: 'Home',
          ),
          GButton(
            icon: Icons.add_circle,
            text: 'Labels',
          ),
          GButton(icon: Icons.inventory, text: 'Status'),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      );
    }
    else {
      // Default navigation bar for other user types
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
            text: 'Home',
          ),
          GButton(
            icon: Icons.near_me,
            text: 'Send',
          ),
          GButton(icon: Icons.fire_truck_outlined, text: 'Status'),
          GButton(icon: Icons.warehouse, text: 'Warehouse'),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      );
    }
  }

  void _selectedPageIndex(int value) {
    setState(() {
      index = value;
    });
  }
}
