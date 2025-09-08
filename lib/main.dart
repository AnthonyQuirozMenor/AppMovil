import 'package:flutter/material.dart';
import 'package:u_swarp/src/constants/app_colors.dart';
import 'package:u_swarp/src/features/dashboard_screen.dart';
import 'package:u_swarp/src/features/register_screen.dart';
import 'package:u_swarp/src/features/welcome_screen.dart';
import 'package:u_swarp/src/routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App movil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'SansSerif'
       
      ),
      initialRoute: AppRoutes.Welcome,
      routes: {
        AppRoutes.Welcome: (context) => const WelcomeScreen(),
     //   AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
    
    
      }
    );
  }
}
