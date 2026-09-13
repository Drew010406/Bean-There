import 'package:bean_there/screens.dart/top_spots.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:bean_there/screens.dart/map_screen.dart';
import 'package:bean_there/screens.dart/calendar.dart';


class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}


class _HostScreenState extends State<HostScreen> {

  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MapScreen(),
    const CalendarScreen(),
    const TopSpotsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ), 

      bottomNavigationBar: NavigationBarTheme(

        data: NavigationBarThemeData(
          indicatorColor: Color.fromARGB(255, 240, 157, 193),
          overlayColor: WidgetStatePropertyAll(Color.fromARGB(255, 240, 157, 193)),
          indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)),
          height: 80,
          backgroundColor: Color.fromARGB(255, 253, 220, 227),
        ),

        child: NavigationBar(

          selectedIndex: _currentIndex,

          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },

          destinations: const [

            NavigationDestination(icon: Icon(Symbols.map, weight: 1000.0, size: 25.0,), selectedIcon: Icon(Symbols.map, weight: 1000.0, size: 25.0, color: Colors.white), label: "Map"),
            NavigationDestination(icon: Icon(Symbols.calendar_today, weight: 1000.0, size: 25.0,), selectedIcon: Icon(Symbols.calendar_today, weight: 1000.0, size: 25.0, color: Colors.white), label: "Calendar"),
            NavigationDestination(icon: Icon(Symbols.leaderboard, weight: 1000.0, size: 25.0,), selectedIcon: Icon(Symbols.leaderboard, weight: 1000.0, size: 25.0, color: Colors.white), label: "Top Spots")
          ]
         ) 
      )  
      
    );

  }

}
