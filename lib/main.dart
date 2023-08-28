import 'package:flutter/material.dart';
import 'package:klima_flutter_app/pages/loading_screen.dart';
import 'package:klima_flutter_app/pages/location_screen.dart';
import 'package:klima_flutter_app/pages/city_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/LoadingScreen': (context) => const LoadingScreen(),
        '/LocationScreen': (context) => const LocationScreen(),
        '/CityScreen': (context) => const CityScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}
