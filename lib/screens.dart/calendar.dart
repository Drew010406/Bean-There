import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' hide TextDirection;

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState(); 
}

class _CalendarScreenState extends State<CalendarScreen> {

  final DateTime _focusedDay = DateTime.now();
  final DateTime _firstDay = DateTime(2026, 1, 6);
  final DateTime _lastDay = DateTime(2040,12,31);

  bool clicked = false;
  DateTime ? _selectedDay;

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

    var upcomingDates = dateRecord.entries.toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 240, 245) ,

      body: Stack(

        children: [

          //BACKGROUND FILLER FOR THE WHITE BACKGROUND IN THE CALENDAR
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),
            height: 380,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color.fromARGB(128, 161, 156, 156), width: 2.0),
              borderRadius:  BorderRadius.circular(35.0),
              boxShadow: [BoxShadow(color: const Color.fromARGB(128, 161, 156, 156), offset: Offset(0,2))]    
            ),

          ),

          //CALENDAR LAYOUT
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0),
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TableCalendar(

              rowHeight: 45.0,
              sixWeekMonthsEnforced: true,

              focusedDay: _focusedDay, 
              firstDay: _firstDay, 
              lastDay: _lastDay,

              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },

              onDaySelected: (selectedDay, focusedDay ) {
                setState(() {
                  _selectedDay = selectedDay;
                  focusedDay = _focusedDay;  
                });
              },


              headerStyle: HeaderStyle(

                headerPadding: EdgeInsets.only(top: 7.0),

                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: GoogleFonts.dmSans(
                  color: const Color.fromARGB(255, 220, 74, 123),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),

                leftChevronMargin: EdgeInsets.only(left: 20.0),
                rightChevronMargin: EdgeInsets.only(right: 20.0),

                leftChevronIcon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 220, 74, 123),),
                rightChevronIcon: Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 220, 74, 123),)

              ),

              calendarStyle: CalendarStyle(

                cellMargin: EdgeInsets.all(5.0),
                todayDecoration: ShapeDecoration(

                  color: const Color.fromARGB(255, 228, 159, 189),
                  shape: HeartBorder(),
                  ),

                selectedDecoration: ShapeDecoration(

                  color: const Color.fromARGB(255, 209, 93, 143),
                  shape: HeartBorder(),
                  ),

                defaultTextStyle: GoogleFonts.dmSans(
                  fontSize: 15.0,
                  ),

                rowDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0)),

                  ),

                tableBorder: TableBorder(
                  top: BorderSide(color: Colors.white),
                  left: BorderSide(color: Colors.white),
                  bottom: BorderSide(color: Colors.white),
                  right: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(40.0),
                  
                  
                ),
              ),

              daysOfWeekHeight: 80.0,
              daysOfWeekStyle: DaysOfWeekStyle(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))
                ),

                weekdayStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),

                weekendStyle: const TextStyle(
                  color: Color.fromARGB(255, 242, 105, 205),
                  fontWeight: FontWeight.bold,

                ),


                dowTextFormatter: (date,locale) {
                  return DateFormat.E(locale).format(date)[0];
                }

              ),

            ),
            

          ),

          //UPCOMING DATES LAYOUT
          Container(
          
            margin: EdgeInsets.only(top: 450, left: 23, right: 19),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [

                //Header
                  Text(
                    "Upcoming Dates",
                    style: GoogleFonts.dmSans(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),

                Expanded(

                  child: ListView.builder(
                    itemCount: upcomingDates.length,
                    itemBuilder: (context, index) {
                      
                      final date = upcomingDates[index];
                      final place = date.key;
                      final description = date.value.$1;
                      final time = DateFormat('hh:mm a').format(date.value.$2);
                      final logo = date.value.$3;

                      return Container(

                        margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                        height: 90,

                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color.fromARGB(128, 161, 156, 156), width: 2.0),
                          borderRadius:  BorderRadius.circular(40.0),
                          boxShadow: [BoxShadow(color: const Color.fromARGB(128, 161, 156, 156), offset: Offset(0,2),)]

                        ),

                        child: ListTile(

                          leading: 
                            CircleAvatar(
                              radius:35,
                              backgroundImage: AssetImage(logo),  
                          ),

                          title: Padding(
                            padding: EdgeInsets.only(left: 5),

                            child: Text(
                              place, 
                              style: GoogleFonts.dmSans(color: Colors.black, fontSize: 23, fontWeight: FontWeight.w500),
                          ) ,
                          ),

                          subtitle: Row(

                            children: [
                              Icon(Icons.schedule, color: Colors.grey),
                              SizedBox(width: 10,),
                              Text(
                                "$description - $time", 
                                style: GoogleFonts.dmSans(color: const Color.fromARGB(255, 17, 16, 16), fontSize: 16),
                                
                              ),
                            ]
                            ),
                          isThreeLine: true,
                      )
                      );
                      
                    }
                  ),
                ) 
              ]  
            )
          ),

          //ADD DATE BUTTON
          Container(

            margin: EdgeInsets.fromLTRB(340, 650, 10, 10),

            child: Theme(
              data: Theme.of(context).copyWith(
                shadowColor: Color.fromARGB(113, 248, 3, 85),
              ),

              child: FloatingActionButton(

                onPressed: () {},
                backgroundColor: Color.fromARGB(255, 227, 93, 138),

                elevation: 10,
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
                ),

                child: Icon(Icons.add, color: Colors.white, size: 30,)
                ) ,
            ),

          )
        ],


      ), 

    );
  }
}

class HeartBorder extends ShapeBorder {
  const HeartBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final width = rect.width;
    final height = rect.height;
    final left = rect.left;
    final top = rect.top;

    // Start at the top center dip of the heart
    path.moveTo(left + width * 0.5, top + height * 0.28);

    // Narrow top-left lobe and left curve down to the bottom point
    path.cubicTo(
      left + width * 0.5, top + height * 0.08,  // Control point 1 (lifts top center)
      left + width * 0.15, top + height * 0.05, // Control point 2 (narrower outer left edge)
      left + width * 0.15, top + height * 0.42, // End point of the left lobe
    );
    path.cubicTo(
      left + width * 0.15, top + height * 0.65, // Control point 1 (slender left flank)
      left + width * 0.35, top + height * 0.85, // Control point 2 (guides down to tip)
      left + width * 0.5, top + height,         // Bottom tip of the heart
    );

    // Narrow right curve up from the bottom tip to the top-right lobe
    path.cubicTo(
      left + width * 0.65, top + height * 0.85, // Control point 1 (guides up from tip)
      left + width * 0.85, top + height * 0.65, // Control point 2 (slender right flank)
      left + width * 0.85, top + height * 0.42, // End point of the right lobe
    );
    path.cubicTo(
      left + width * 0.85, top + height * 0.05, // Control point 1 (narrower outer right edge)
      left + width * 0.5, top + height * 0.08,  // Control point 2 (lifts top center)
      left + width * 0.5, top + height * 0.28,  // Returns cleanly to the center dip
    );

    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Leave empty if you just want the parent widget to fill the background color
  }

  @override
  ShapeBorder scale(double t) => const HeartBorder();
}
