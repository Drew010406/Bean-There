import 'package:bean_there/screens.dart/host_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {

  await dotenv.load(fileName: ".env");

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
                fontSize: 30.0),
              ),
            
        backgroundColor: const Color.fromARGB(255, 255, 236, 242),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: const Color.fromARGB(255, 240, 207, 217), width: 3)
        ),

        surfaceTintColor: const Color.fromARGB(255, 240, 207, 217),

      ),

      body: const HostScreen(),

    )

  ));
}

