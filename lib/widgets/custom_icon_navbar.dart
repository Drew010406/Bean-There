import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildIconWithLabel(IconData icon, String label, bool selected) {

  if (selected) {
    return Container(
    
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 209, 93, 143),
        boxShadow: [
          BoxShadow(color: const Color.fromARGB(255, 141, 112, 124), offset: Offset(0, 3))
        ]
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: [

          Icon(icon, size: 27.0, weight: 1000, color: Colors.white,),

          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 5)
          ),

          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  else {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: [

          Icon(icon, size: 27.0, weight: 1000,),

          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 5)
          ),

          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
    
  }
  
}
