import 'package:bean_there/screens.dart/top_spots.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:bean_there/screens.dart/map_screen.dart';
import 'package:bean_there/screens.dart/calendar.dart';

import'package:bean_there/widgets/custom_icon_navbar.dart';

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


      
      bottomNavigationBar: Container(

        decoration: BoxDecoration(

          border: Border(
            top: BorderSide(color: const Color.fromARGB(255, 255, 236, 242), width: 4),

          ),

          borderRadius: BorderRadiusDirectional.circular(30),

          color: const Color.fromARGB(255, 255, 236, 242),
          //shadowColor: const Color.fromARGB(255, 240, 207, 217),

          boxShadow: [
            BoxShadow(color: const Color.fromARGB(255, 240, 207, 217), offset: Offset(0, -4))
          ]
        ),
        

        child: NavigationBarTheme(

          data: NavigationBarThemeData(
            
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(30),
            ),

            labelPadding: EdgeInsets.all(10),
            height: 75,
            backgroundColor: Colors.transparent,

          ),

          child: NavigationBar(

            selectedIndex: _currentIndex,

            animationDuration: Duration(microseconds: 300),

            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },

            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,

            destinations: [
              NavigationDestination(
                icon: buildIconWithLabel(Symbols.map, "Map", false),
                selectedIcon: buildIconWithLabel(Symbols.map, "Map", true),
                label: "Map"
              ),

              NavigationDestination(
                icon: buildIconWithLabel(Symbols.calendar_today, "Calendar", false),
                selectedIcon: buildIconWithLabel(Symbols.calendar_today, "Calendar", true),
                label: "Calendar"
              ),

              NavigationDestination(
                icon: buildIconWithLabel(Symbols.leaderboard, "Favorites", false),
                selectedIcon: buildIconWithLabel(Symbols.leaderboard, "Favorites", true),
                label: "Top Spots"
              )
            ]

          ) 
        )  
      )
    );
  }
}
