import 'package:flutter/material.dart';
import 'package:klima_flutter_app/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  CityScreenState createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  String searchedCityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackground1,
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 35.0,
            color: black,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Search by City',
          style: GoogleFonts.aBeeZee(
              color: black, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.location_city,
                      size: 200.0,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      style: TextStyle(
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        searchedCityName = value;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100.0),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, searchedCityName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Get Weather',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ),
              ),
              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
