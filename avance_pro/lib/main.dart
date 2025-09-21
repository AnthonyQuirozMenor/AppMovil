
import 'package:avance_pro/bloc/Auth.dart';
import 'package:avance_pro/routes/AppRoutes.dart';
import 'package:avance_pro/screens/RouteScreen.dart';
import 'package:avance_pro/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web, // Web
  );

  // Persistencia de sesión en Web
  if (kIsWeb) {
    await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mi App',
        theme: AppTheme.lightTheme,
        routes: AppRoutes.routes, // por si navegas a otras pantallas
        home: const RootScreen(), // <- clave
      ),
    );
  }
}