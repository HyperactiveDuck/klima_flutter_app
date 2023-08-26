import 'package:flutter/material.dart';
import 'package:klima_flutter_app/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    LocationFetcher locationFetcher = LocationFetcher();
    await locationFetcher.getLocation();
  }

  void getData() {
    Future<http.Response> response = http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=33.0184&lon=49.2419&exclude={part}&appid=2365074cdb2b5aab4c78d415855e9d06',
      ),
    );
    response.then((value) => debugPrint(value.body));
  }

  @override
  void initState() {
    super.initState();
    getData();
    getLocation();
    debugPrint('state called');
  }

  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
