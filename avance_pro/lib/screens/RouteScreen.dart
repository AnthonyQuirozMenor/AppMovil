// lib/screens/root_screen.dart
import 'package:avance_pro/screens/LoginScreen.dart';
import 'package:avance_pro/screens/home/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    return StreamBuilder<User?>(
      stream: _auth.userChanges(), // <- más eventos que authStateChanges
      builder: (context, snap) {
        // Debug: ver en UI qué está pasando
        // (Puedes remover esto luego)
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snap.data;
        // Muestra una esquina con el estado actual
        return Stack(
          children: [
            if (user != null) const HomeScreen() else const LoginScreen(),

            // Overlay de depuración (arriba a la izquierda)
            Positioned(
              left: 8,
              top: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    user != null
                        ? 'auth: ${user.email ?? user.uid}'
                        : 'auth: null',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}