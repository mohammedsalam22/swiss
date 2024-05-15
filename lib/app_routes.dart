import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/HomePage/home_view.dart';
import 'package:swis_warehouse/ui/screens/HomePage/navigation_menu.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/navigation_menu.dart';
import 'package:swis_warehouse/ui/screens/LoginPage.dart';
import 'constant_stuff/routes_name.dart';
import 'package:swis_warehouse/ui/screens/RegesterationInfo.dart';
class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case loginScreen:
    return MaterialPageRoute(builder: (_)=> const LoginPage());
      case 'RegistrationInfo' :
        return MaterialPageRoute(builder: (_)=> const RegistrationInfo());
      case navbar:
        return MaterialPageRoute(builder: (_)=> const NavigationMenu());
      case home :
        return MaterialPageRoute(builder: (_)=> const HomeView());
    }
    return null;
  }
}