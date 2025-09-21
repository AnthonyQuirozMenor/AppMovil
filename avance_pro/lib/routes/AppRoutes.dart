
import 'package:avance_pro/screens/home/HomeScreen.dart';
import 'package:avance_pro/screens/LoginScreen.dart';
import 'package:avance_pro/screens/RegisterScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const register = '/register';

  static Map<String, WidgetBuilder> routes = {
    login: (_) => const LoginScreen(),
    register: (_) => const RegisterScreen(),
    home: (_) => const HomeScreen(),
  };
}