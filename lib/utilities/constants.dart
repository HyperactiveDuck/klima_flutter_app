import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTempTextStyle = GoogleFonts.leagueSpartan(
  fontSize: 100.0,
);

TextStyle kMessageTextStyle = GoogleFonts.leagueSpartan(
  fontSize: 60.0,
);
TextStyle kButtonTextStyle = GoogleFonts.leagueSpartan(
  fontSize: 30.0,
);

TextStyle kConditionTextStyle = GoogleFonts.leagueSpartan(
  fontSize: 100.0,
);

InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: const Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: const Color.fromARGB(255, 99, 99, 99),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  ),
);
