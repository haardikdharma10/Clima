import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:geolocator/geolocator.dart';

import 'screens/loading_screen.dart';
import 'screens/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
