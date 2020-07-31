import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'a04f34622a3860b708b1ee6da83844fc';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
    print('init state called');
  }

  @override
  void deactivate() {
    print('deactivate called');
    super.deactivate();
  }

  void getLocationData() async {
    Location l = Location();
    await l.getCurrentLocation();
    latitude = l.latitude;
    longitude = l.longitude;
    NetworkHelper networkHelper = NetworkHelper('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

      var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
