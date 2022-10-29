import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';

class LoctionServ {


 static UserLocation? userLocation;
 static Location location = Location();

 static StreamController<UserLocation>loctionController = StreamController<
      UserLocation>.broadcast();

 static Stream<UserLocation> get locationStrem => loctionController.stream;

 static llocationService()async {
   bool _serviceEnabled;
   PermissionStatus _permissionGranted;


   // _serviceEnabled = await location.serviceEnabled();
   // if (!_serviceEnabled) {
   //   _serviceEnabled = await location.requestService();
   //   if (!_serviceEnabled) {
   //     return;
   //   }
   // }

   _permissionGranted = await location.hasPermission();
   if (_permissionGranted == PermissionStatus.denied) {
     _permissionGranted = await location.requestPermission();
     if (_permissionGranted != PermissionStatus.granted) {
       return;
     }
   }


   // location.enableBackgroundMode(enable: true);
    location.changeSettings(
        accuracy: LocationAccuracy.high,
        interval: 10000,
        distanceFilter: 5
    );
   // location.requestPermission().then((value) {
      //  PermissionStatus v=value;

    //  if (value == PermissionStatus.granted) {
        location.onLocationChanged.listen((LocationData currentLocation) {
          loctionController.add(UserLocation(latitude: currentLocation.latitude,
              longitude: currentLocation.longitude));

// print("i get allllllllllllllllllllllllllll   ${currentLocation.latitude}=============${currentLocation}");
//
// Get.snackbar("title", "message");


        });
    //  }
   // });
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




  static Future<LocationData?> getCurLoction() async {
 return await location.getLocation();


 }

}

class UserLocation {
  final double? latitude;
  final double? longitude;

  UserLocation({required this.latitude, required this.longitude});
}