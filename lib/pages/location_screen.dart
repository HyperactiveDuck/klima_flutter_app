import 'package:flutter/material.dart';
import 'package:klima_flutter_app/pages/loading_screen.dart';
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getWeatherData();
                      var locationData = await weather.getLocationData();
                      updateUI(
                          weatherData: weatherData, cityLocation: locationData);
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
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
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
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
