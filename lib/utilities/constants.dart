import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTempTextStyle =
    GoogleFonts.leagueSpartan(fontSize: 100.0, color: Colors.black);

TextStyle kMessageTextStyle = GoogleFonts.leagueSpartan(
  color: Colors.black,
  fontSize: 30.0,
);

TextStyle kButtonTextStyle =
    GoogleFonts.leagueSpartan(fontSize: 30.0, color: Colors.white);

TextStyle kConditionTextStyle =
    GoogleFonts.leagueSpartan(fontSize: 100.0, color: Colors.black);

InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name',
  hintStyle: const TextStyle(
    color: Color.fromARGB(255, 99, 99, 99),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  ),
);

Color primary = const Color.fromARGB(255, 255, 242, 177);
Color black = Colors.black;
Color secondery = const Color.fromARGB(255, 163, 203, 245);
Color appBarBackground1 = const Color.fromARGB(255, 163, 203, 245);
