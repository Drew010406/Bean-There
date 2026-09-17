import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

class TopSpotsScreen extends StatefulWidget {

  const TopSpotsScreen({super.key});
  @override
  State<TopSpotsScreen> createState() => _TopSpotsScreen();
}

class _TopSpotsScreen extends State<TopSpotsScreen> {

  bool isThisWeek = true;

  final Map<String, (String label, double rating, String url)> dateRecord = {

    "Happy Petals" : ("Cafe", 4.8, "assets/images/happy_petals.jpg"),
    "Kape sa Harong": ("Monthsarry Date", 4.8, "assets/images/kape_sa_harong.jpg"),
    "Kape Aldaw": ("Monthsarry Date", 4.8, "assets/images/kafe_aldaw.jpg"),
    "Kin Coffee": ("Monthsarry Date", 4.8, "assets/images/kafe_aldaw.jpg"),
    "528 Ilawod": ("Monthsarry Date", 4.8, "assets/images/kafe_aldaw.jpg"),
    "Random ass cafe": ("Monthsarry Date", 4.8, "assets/images/kafe_aldaw.jpg")
  };

  @override 
  Widget build(BuildContext context) {

    var spotRanking = dateRecord.entries.toList();

    return Scaffold(

      body: Column(

        children: [

          //Container for the upper portion of the favorites section
          Container(

            alignment: Alignment.topCenter,
            height: 250,
            padding: EdgeInsets.only(top:15, left: 25, right: 25),

            child: Column(

              spacing: 30,

              children: [

                //Favorites header
                Text(
                "Favorites",
                style: 
                  GoogleFonts.dmSans(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
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
          Expanded(

            child: ListView.builder(
              
              itemCount: spotRanking.length,
              itemBuilder: (context, index) {

                final spot = spotRanking[index];
                final place = spot.key;
                final label = spot.value.$1;
                final rating = spot.value.$2;
                final logo = spot.value.$3;

                Color borderColor(int index) {

                  if (index + 1 == 1) {
                   return Color.fromARGB(255, 252, 235, 83);
                  }

                  else if (index + 1 == 2) {
                    return Color.fromARGB(255, 146, 146, 146);
                  }

                  else if (index + 1 == 3) {
                    return Color.fromARGB(255, 189, 95, 62);
                  }

                  else {
                    return Color.fromARGB(128, 161, 156, 156);
                  }
                };

                return Container(

                  margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10),
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor(index) , width: 3),
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [BoxShadow(color: borderColor(index), offset: Offset(0,2),)]
                  ),

                  child: ListTile(

                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 20,

                      children: [

                        Text(
                          "${index+1}",
                          style: GoogleFonts.dmSans(color: borderColor(index), fontSize: 25, fontWeight: FontWeight.bold),
                        ), 

                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(logo),
                        ),
                      ],
                    ), 
                    
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        
                        Expanded(
                          
                          child: Text(
                            place,
                            maxLines: 3,
                            style: GoogleFonts.dmSans(
                              color: Colors.black, 
                              fontSize: 20.0, 
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 8.0),
                        
                        Container(
                          
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 250, 189, 215),
                            borderRadius: BorderRadius.circular(50.0),
                            
                          ),

                          child: Row(

                            children: [
                              Text(
                                "$rating",
                                style: GoogleFonts.dmSans(
                                  color: const Color.fromARGB(255, 30, 30, 30), 
                                  fontSize: 15.0, 
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),

                              Icon(Symbols.favorite, color: const Color.fromARGB(255, 0, 0, 0), fill: 0,)
                            ]
                          ) 
                        ),
                      ],
                    ),

                    subtitle: Row(


                      children: [

                        Container(

                          margin: EdgeInsets.only(left: 10),

                          padding: EdgeInsets.fromLTRB(5,2,5,2),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 253, 220, 227),
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(50),
                          ),

                          child: Text(
                            label,
                            style: GoogleFonts.dmSans(color: const Color.fromARGB(255, 35, 34, 34), fontSize: 12.0, fontWeight: FontWeight.bold),
                          )
                        ),

                      ],
                    ),
                  )


                );



              })


          ),
        ],
      )
    );
  }

}
