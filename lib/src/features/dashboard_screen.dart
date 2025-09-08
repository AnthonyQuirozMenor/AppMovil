import 'package:flutter/material.dart';
import 'package:u_swarp/src/constants/app_colors.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});
  

  @override
  State<StatefulWidget> createState()=> _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>{
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    //DashboardHome()
    Text('pantalla de inicio'),
    Text('pantalla de product'),
    Text('pantalla de ventas'),
    Text('pantalla de agustes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello may friends'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Chip(
              avatar: const Icon(Icons.add_shopping_cart, color: AppColors.primary),
              label: const Text('carts'),
              ),
              
          )
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
          DrawerHeader(child: Text('menu iz')),
          ListTile(title: Text('mi perfil')),
           ListTile(title: Text('mi estado'))
          ],
          ),

          ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState((){
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'productos'),
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'ventas'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'ajustes'),
        ],

    ),
    );

  }


}