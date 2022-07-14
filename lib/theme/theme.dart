import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData get lightTheme {
    return
      ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue, brightness: Brightness.light,),
        useMaterial3: true,
          iconTheme: const IconThemeData(
            color: Colors.blueAccent,
          ),
          textTheme: GoogleFonts.sourceSansProTextTheme(),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade50),
              borderRadius: BorderRadius.circular(38.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade50),
              borderRadius: BorderRadius.circular(38.0),
            ),
            filled: true,
          labelStyle: const TextStyle(color: Colors.blueAccent, fontSize: 14.0),
            fillColor: Colors.blue.shade50,
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              primary: Colors.white,
              side: BorderSide(color: Colors.blue.shade50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(38.0),
                ),
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(24.0),
                ),
              ),
            ),
          )
      );
  }
}