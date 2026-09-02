import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Bean There", style: GoogleFonts.dmSans(color: Color.fromARGB(255, 242, 59, 239)),),
        
        
        backgroundColor: Color.fromARGB(255, 255, 239, 255)
      ),
      
      body: const Home(),
      
    )

  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: Text(
          "Empty Screen",
          style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 30),

      )
    );
  }
}

