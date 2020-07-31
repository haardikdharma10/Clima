import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    print('init state called');
  }

  @override
  void deactivate() {
    print('deactivate called');
    super.deactivate();
  }

  void getLocation() async {
    Location l = Location();
    await l.getCurrentLocation();
    print(l.latitude);
    print(l.longitude);
  }

  void getData()async{
    http.Response response =  await http.get('https://samples.openweathermap.org/data/2.5/weather?id=2172797&appid=439d4b804bc8187953eb36d2a8c26a02');
    
    if(response.statusCode ==200){
      String data = response.body;
      print(data);
    }
    else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
