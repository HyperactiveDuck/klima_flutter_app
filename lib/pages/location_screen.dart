// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klima_flutter_app/utilities/constants.dart';
import 'package:klima_flutter_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather, this.cityLocation});
  final cityLocation;
  final locationWeather;

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temp = 0;
  String weatherIcon = '';
  String cityName = '';
  String weatherMessage = '';

  @override
  void initState() {
    super.initState();
    debugPrint('initState called');

    updateUI(
        weatherData: widget.locationWeather,
        cityLocation: widget.cityLocation,
        weatherDataByCity: widget.locationWeather);
  }

  void updateUI(
      {dynamic weatherData, dynamic cityLocation, dynamic weatherDataByCity}) {
    if (weatherData == null && weatherDataByCity == null) {
      temp = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
      return;
    }
    if (cityLocation == null ||
        cityLocation.isEmpty ||
        cityLocation[0]['name'] == null) {
      cityName = weatherDataByCity['name'];
    } else {
      cityName = cityLocation[0]['name'];
    }
    double temperature;
    if (weatherData == null ||
        weatherData.isEmpty ||
        weatherData['current']['temp'] == null) {
      temperature = weatherDataByCity['main']['temp'];
    } else {
      temperature = weatherData['current']['temp'];
    }

    temp = temperature.toInt();

    var condition;
    if (weatherData == null ||
        weatherData.isEmpty ||
        weatherData['current']['weather'][0]['id'] == null) {
      condition = weatherDataByCity['weather'][0]['id'];
    } else {
      condition = weatherData['current']['weather'][0]['id'];
    }

    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessage = weather.getMessage(temp);
    debugPrint(
        ' Isı : $temp \n Hava durumu : $condition \n Bölge : $cityName ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 163, 203, 245),
        automaticallyImplyLeading: false,
        title: Text(
          'Klima',
          style: GoogleFonts.aBeeZee(
              color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Tooltip(
          message: 'Refresh your location.',
          child: TextButton(
            onPressed: () async {
              var weatherData = await weather.getWeatherData();
              var locationData = await weather.getLocationData();
              updateUI(weatherData: weatherData, cityLocation: locationData);
              setState(() {});
            },
            child: const Icon(
              Icons.location_searching_outlined,
              size: 35.0,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          Tooltip(
            message: 'Search by city name.',
            child: TextButton(
              onPressed: () async {
                var typedName =
                    await Navigator.pushNamed(context, '/CityScreen');
                if (typedName != null) {
                  var weatherDataByCity =
                      await weather.getCityWeather(typedName.toString());
                  updateUI(weatherDataByCity: weatherDataByCity);
                  setState(() {});
                }
              },
              child: const Icon(
                Icons.search,
                size: 40.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[],
              ),
              Column(
                children: <Widget>[
                  Text(
                    weatherIcon,
                    style: kConditionTextStyle,
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    ' $temp°',
                    style: kTempTextStyle,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                child: Text(
                  'Tip: \n$weatherMessage in $cityName',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
