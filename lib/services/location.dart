import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  //Using future so that we can use async and await when we call the method
  //in loading_screen
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
