import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class maps extends StatefulWidget {

  @override
  State<maps> createState() => _mapsState();

}

class _mapsState extends State<maps> {

  var _index = 2;
  final LatLng _location = const LatLng(30.0272, 31.4917);
  late GoogleMapController mapController;
  void _myMaCreated (GoogleMapController controller){
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: Text('Our Branch'),
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body:
        GoogleMap(
          mapType: MapType.hybrid,
          onMapCreated:_myMaCreated ,
          initialCameraPosition: CameraPosition(
              target: _location ,bearing: 45.0,tilt: 10 , zoom: 16.5),

          markers: {
            Branch
          },
        ),



        // floatingActionButton: FloatingActionButton.extended(onPressed: getCurrentLocation, label: Icon(Icons.gps_fixed)),
      ),
    );
  }
}


Marker Branch = Marker(
    markerId: MarkerId("Stomache"),
    position: const LatLng(30.0272, 31.4917),
    infoWindow: InfoWindow(title: "Stomache Restaurant"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose));