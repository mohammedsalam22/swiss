import 'package:flutter/material.dart';
import 'package:swis_warehouse/constant_stuff/routes_name.dart';
import 'package:swis_warehouse/ui/screens/About%20us/about_us.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.red,
              //image: DecorationImage(image: AssetImage('assets/swis.png'),fit: BoxFit.cover)
            ),
            accountName: const Text('Mohammed Salam'),
            accountEmail: const Text('Salam@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          const ListTile(
            leading: Icon(Icons.upload),
            title: Text('uploud'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text('messages'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('notifications'),
          ),
          InkWell(
            onTap: (){Navigator.pushNamed(context, aboutUs);},
            child: const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('about us'),
            ),
          ),
          InkWell(
            onTap: (){Navigator.pushNamed(context, terms);},
            child: const ListTile(
              leading: Icon(Icons.rule_sharp),
              title: Text('terms&conditions '),
            ),
          ),
          Divider(),
          InkWell(
            onTap:(){Navigator.pushReplacementNamed(context, loginScreen);},
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout'),
            ),
          ),
        ],
      ),
    );
  }
}
