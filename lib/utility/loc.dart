import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';

class LoctionServ {


  UserLocation? userLocation;
  Location location = Location();

  StreamController<UserLocation>loctionController = StreamController<
      UserLocation>.broadcast();

  Stream<UserLocation> get locationStrem => loctionController.stream;

  llocationService() {
    location.enableBackgroundMode(enable: true);
    location.changeSettings(
        accuracy: LocationAccuracy.high,// distanceFilter: 10
    );
    location.requestPermission().then((value) {
      //  PermissionStatus v=value;

      if (value == PermissionStatus.granted) {
        location.onLocationChanged.listen((LocationData currentLocation) {
          loctionController.add(UserLocation(latitude: currentLocation.latitude,
              longitude: currentLocation.longitude));

print("i get allllllllllllllllllllllllllll   ${currentLocation.latitude}=============${currentLocation}");

Get.snackbar("title", "message");


        });
      }
    });
  }


  Future<UserLocation?> getLoction() async {
    try {
      var userLoc = await location.getLocation();
      userLocation = UserLocation(
          latitude: userLoc?.latitude, longitude: userLoc?.longitude);
    } catch (e) {
      print(e.toString());
    }
  }

}

class UserLocation {
  final double? latitude;
  final double? longitude;

  UserLocation({required this.latitude, required this.longitude});
}