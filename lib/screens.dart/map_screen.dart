import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MapScreen extends StatefulWidget {

  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(13.144167, 123.725763);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 15.0),
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            style: '''[
                {"featureType": "poi", "stylers": [{"visibility": "off"}]}, 
                {"featureType": "transit", "stylers": [{"visibility": "off"}]}
                      ]
                  '''),

          Positioned(
            top: 20.0,
            left: 20.0,
            right: 20.0,


            child: Container(

              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(50),
                
              ),              

              child: TextField(
                
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hint: Text(
                    "Search for a place...",
                    style: GoogleFonts.dmSans(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 136, 131, 131),
                      ),
                  ),
                  icon: Padding(
                    padding: EdgeInsetsGeometry.only(left: 10.0),
                    child: Icon(Icons.search, color: Color.fromARGB(255, 209, 93, 143), size: 27.0,),
                  ) 
                ),
              )
              
            ) 
            
            )


        ],
      )
    ); 
      
      
      
  }
}