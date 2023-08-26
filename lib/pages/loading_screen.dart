import 'package:flutter/material.dart';
import 'package:klima_flutter_app/services/location.dart';
import 'package:klima_flutter_app/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  var apiKey = "2365074cdb2b5aab4c78d415855e9d06";

  void getLocationData() async {
    LocationFetcher locationFetcher = LocationFetcher();
    await locationFetcher.getLocation();
    NetworkHelper networkHelper = NetworkHelper();

    var weatherData = await networkHelper.getData(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${locationFetcher.latitude}&lon=${locationFetcher.longitude}&appid=$apiKey&units=metric');
    var cityData = await networkHelper.getCityName(
        'http://api.openweathermap.org/geo/1.0/reverse?lat=${locationFetcher.latitude}8&lon=${locationFetcher.longitude}&appid=$apiKey');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
          cityLocation: cityData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
