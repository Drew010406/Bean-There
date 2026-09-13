import 'package:bean_there/screens.dart/host_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {

  runApp(MaterialApp(
    
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(

        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          "Bean There", 
          style: GoogleFonts.dmSans(
                color: Color.fromARGB(255, 209, 93, 143), 
                fontWeight: FontWeight.bold,
                fontSize: 27.0),
              ),
            
        backgroundColor: Color.fromARGB(255, 253, 220, 227)
      ),

      body: const HostScreen(),

    )

  ));
}

