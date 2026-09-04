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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ), 

      bottomNavigationBar: NavigationBar(

        indicatorColor: Color.fromARGB(255, 209, 93, 143),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)),
        selectedIndex: _currentIndex,
        height: 80,
        backgroundColor: Color.fromARGB(255, 253, 220, 227),

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
    );

  }

}
