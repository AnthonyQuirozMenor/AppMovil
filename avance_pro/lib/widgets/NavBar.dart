// lib/widgets/bottom_nav_scaffold.dart
import 'package:avance_pro/bloc/UserBloc.dart';
import 'package:avance_pro/screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class BottomNavScaffold extends StatefulWidget {
  final Widget home;
  const BottomNavScaffold({super.key, required this.home});

  @override
  State<BottomNavScaffold> createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends State<BottomNavScaffold> {
  int _index = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      widget.home,
      const _Dummy('Explore'),
      const _Dummy('Cart'),
      const _Dummy('Alerts'),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          // se crea una sola vez y vive mientras vive el BottomNav
          create: (_) => UserCubit(
            auth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,
          )..load(), // carga inicial
        ),
      ],
      child: Scaffold(
        body: IndexedStack(
          // <-- conserva estado de cada tab
          index: _index,
          children: _pages,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.remove_red_eye_outlined),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_none),
              label: 'Alerts',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class _Dummy extends StatelessWidget {
  final String text;
  const _Dummy(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Center(child: Text(text));
}