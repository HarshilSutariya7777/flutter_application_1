import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/city.model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class CurrentLocation {
  CityModel? cityModel;
  Future<CityModel> getLatLong(BuildContext context) async {
    CityModel? address;
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      Position? geopos;
      try {
        geopos = await Geolocator.getLastKnownPosition();
      } catch (e) {
        geopos = await Geolocator.getLastKnownPosition();
      }
      if (geopos != null) {
        address = CityModel(
            geopos.floor.toString(), geopos.latitude, geopos.longitude);
        return address;
      } else {
        return CityModel("All Location", 0.0, 0.0);
      }
    } else if (status == PermissionStatus.denied) {
      return CityModel("All location", 0.0, 0.0);
    } else if (status == PermissionStatus.permanentlyDenied) {
      return CityModel("All Location", 0.0, 0.0);
    } else {
      if (address == null) {
        return CityModel("All Location", 0.0, 0.0);
      }
      return address;
    }
  }
}
