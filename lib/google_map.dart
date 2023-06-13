import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/current_Laction.dart';
import 'package:flutter_application_1/model/city.model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Path extends StatefulWidget {
  const Path({super.key});

  @override
  State<Path> createState() => _PathState();
}

class _PathState extends State<Path> {
  final Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  CityModel? cModel;
  List<Marker> addMarkers = <Marker>[];
  CameraPosition kmapCamera =
      const CameraPosition(target: LatLng(21.238345, 72.889941), zoom: 14);

  onMapCreated(GoogleMapController controller) {
    mapcontroller.complete(controller);
    googleMapController = controller;
  }

  updateCameraPosition(CameraPosition cameraPosition) {
    googleMapController?.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude),
        cameraPosition.zoom));
  }

  getUserLocation(BuildContext context) async {
    var temp = await CurrentLocation().getLatLong(context);
    cModel = temp;
    if (cModel == null) {
      return;
    }
    kmapCamera = CameraPosition(
      target: LatLng(cModel!.lat, cModel!.lng),
      zoom: 14,
    );
    updateCameraPosition(kmapCamera);
  }

  @override
  void initState() {
    getUserLocation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: kmapCamera,
          onMapCreated: onMapCreated,
          myLocationEnabled: true,
          markers: Set.from(addMarkers),
          onTap: (LatLng latlng) {
            debugPrint("lattitude on Map:${latlng.latitude}");
            debugPrint("longlattitude on map:${latlng.longitude}");
            setState(() {
              //addMarkers = [];
              addMarkers.add(
                Marker(markerId: MarkerId(latlng.toString()), position: latlng),
              );
            });
          }),
    );
  }

  // handleTap(LatLng tappedpoint) {
  //   print(tappedpoint);
  //   setState(() {
  //     //addMarkers = [];
  //     addMarkers.add(Marker(
  //         markerId: MarkerId(tappedpoint.toString()), position: tappedpoint));
  //   });
  // }
}
