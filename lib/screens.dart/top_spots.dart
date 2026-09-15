import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopSpotsScreen extends StatefulWidget {

  const TopSpotsScreen({super.key});
  @override
  State<TopSpotsScreen> createState() => _TopSpotsScreen();
}

class _TopSpotsScreen extends State<TopSpotsScreen> {

  bool isThisWeek = true;

  final Map<String, (String label,DateTime date, String url)> dateRecord = {

    "Happy Petals" : ("Monthsarry Date", DateTime(2026, 10, 19, 19, 30), "assets/images/happy_petals.jpg"),
    "Kape sa Harong": ("Monthsarry Date", DateTime(2026, 10, 19, 19, 30), "assets/images/kape_sa_harong.jpg"),
    "Kape Aldaw": ("Monthsarry Date", DateTime(2026, 10, 19, 19, 30), "assets/images/kafe_aldaw.jpg"),
    "Kin Coffee": ("Monthsarry Date", DateTime(2026, 10, 19, 19, 30), "assets/images/kafe_aldaw.jpg"),
    "528 Ilawod": ("Monthsarry Date", DateTime(2026, 10, 19, 19, 30), "assets/images/kafe_aldaw.jpg"),
    "Random ass cafe": ("Monthsarry Date", DateTime(2026, 10, 19, 19, 30), "assets/images/kafe_aldaw.jpg")
  };

  @override 
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          //Container for the upper portion of the favorites section
          Container(

            alignment: Alignment.topCenter,
            height: 250,
            padding: EdgeInsets.only(top:15, left: 25, right: 25),

            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),

            child: Column(

              spacing: 30,

              children: [

                //Favorites header
                Text(
                "Favorites",
                style: 
                  GoogleFonts.dmSans(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
                ),

                //Favorites description
                Text(
                  "Here's the list of the spots we've been to, including their ranking and ratings.",
                  style: 
                    GoogleFonts.dmSans(color: Colors.black, fontSize:15),
                    textAlign: TextAlign.center,
                ),

                //List Filter (This week/All time)
                AnimatedToggleSwitch<bool>.dual(

                  current: isThisWeek, 
                  first: false,
                  second: true,

                  spacing: 0.0,

                  indicatorSize: Size.fromWidth(110),
                  indicatorTransition: ForegroundIndicatorTransition.fading(),

                  textBuilder: (value) => Text(

                    value ? "This week" : "All time",
                    style: GoogleFonts.dmSans(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  iconBuilder:(value) => Text(
                    value ? "All time" : "This week",
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  borderWidth: 4.0,

                  style: ToggleStyle(
                    backgroundColor: const Color.fromARGB(255, 254, 252, 255)
,
                    indicatorColor: const Color.fromARGB(255, 255, 132, 173),
                    borderRadius: BorderRadius.circular(50),
                    borderColor: const Color.fromARGB(197, 245, 238, 238),
                  ),

                  animationDuration: Duration(milliseconds: 200),
                  onChanged: (value) => setState(() => isThisWeek = value),

                )



              ],
            )
          ),
              
          //Container for the actual list
          Container(

            margin: EdgeInsets.only(top: 5.0),
            alignment: Alignment.center,

            child: ListTile(

              leading: CircleAvatar(
                radius:  35,
                backgroundImage: AssetImage(),
              ),




            ),
          ),
        ],
      )
    );
  }

}
