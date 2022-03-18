import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maan_food/Screens/Profile/notifications/notification_widget.dart';
import 'package:maan_food/services/geo_location.dart';
import 'package:maan_food/services/utils.dart';
import 'package:provider/provider.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  late GoogleMapController mapController; //controller for Google map
  final Set<Marker> _markers = {}; //markers for google map
  late LatLng _showLocation;
  late String _mapStyle;
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      getMarkers();
    });
    super.initState();

    rootBundle.loadString('images/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Position _position =
        Provider.of<PositionProvider>(context, listen: false).position;
    _showLocation = LatLng(
        _position.latitude, _position.longitude); //location to show in map

    Set<Circle> _circles = {
      Circle(
        circleId: const CircleId(''),
        center: _showLocation,
        radius: 5000,
        fillColor: Colors.red.shade100.withOpacity(0.5),
        strokeColor: Colors.red.shade100.withOpacity(0.1),
      )
    };

    return Scaffold(
      body: GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          // Generate 100 widgets that display their index in the List.
          children: [
            Center(
              child: GoogleMap(
                  buildingsEnabled: false,
                  zoomGesturesEnabled: false,
                  scrollGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  zoomControlsEnabled: false,
                  onCameraMove: null,
                  circles: _circles,
                  //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition(
                    //initial position in map
                    target: _showLocation, //initial position
                    zoom: 12, //initial zoom level
                  ),
                  markers: _markers,
                  //markers to show on map
                  mapType: MapType.normal,
                  //map type
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                      mapController.setMapStyle(_mapStyle);
                    });
                  }),
            ),
            ListView.builder(
              // should be changed to stream builder once the data is fetched from firebase
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) => NotificationWidget(
                  title: 'Theresa Webb',
                  subTitle: '5 min ago',
                  imageUrl: 'images/round_logo.png',
                  onTap: () {}),
            ),
          ]),
    );
  }

  void getMarkers() async {
    final userPhoto = FirebaseAuth.instance.currentUser!.photoURL;
    //final Uint8List markerIcon = await getBytesFromNetworkUrl(userPhoto!, 100);
    final iconMarker = await resizeAndCircle(userPhoto!, 100);

    //markers to place on map
    setState(() {
      _markers.add(Marker(
        //add first marker
        markerId: MarkerId(_showLocation.toString()),
        position: _showLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: iconMarker, //Icon for Marker
      ));

      _markers.add(Marker(
        //add second marker
        markerId: MarkerId(const LatLng(37.804834, -122.428417).toString()),
        position: const LatLng(37.804834, -122.428417), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title default ',
          snippet: 'My  default maker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      //add more markers here
    });
  }
}
