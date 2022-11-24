import 'package:flutter/material.dart';
import 'package:polla_futbolera/ui/screens/home/home_screen.dart';
import 'package:polla_futbolera/ui/screens/login/login_screen.dart';

class AppRoutes {
  static const initialRoute = 'home_screen';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login_screen': (BuildContext context) => const LoginScreen(),
    'home_screen': (BuildContext context) => const HomeScreen(),
  };
}
