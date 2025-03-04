import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/About%20us/about_us.dart';
import 'package:swis_warehouse/ui/screens/About%20us/terms.dart';
import 'package:swis_warehouse/ui/screens/Auth/complete_profile.dart';
import 'package:swis_warehouse/ui/screens/Auth/loginPage.dart';
import 'package:swis_warehouse/ui/screens/ForgetPassword/forget_password.dart';
import 'package:swis_warehouse/ui/screens/HomePage/home_view.dart';
import 'package:swis_warehouse/ui/screens/HomePage/view.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/navigation_menu.dart';
import 'package:swis_warehouse/ui/screens/ProfilePage/editprofile_view.dart';
import 'constant_stuff/routes_name.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case registeration:
        return MaterialPageRoute(builder: (_) => const CompleteProfile());
      case navbar:
        return MaterialPageRoute(builder: (_) => const NavigationMenu());
      case home:
        return MaterialPageRoute(builder: (_) =>  WarehouseView());
      case forget_password:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      case terms:
        return MaterialPageRoute(builder: (_) => const TermsAndConditionsScreen());
      case edit:
        return MaterialPageRoute(builder: (_) => const EditProfile());
    }
    return null;
  }
}
