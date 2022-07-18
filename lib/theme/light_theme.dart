import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData get lightTheme {
    return
      ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue, brightness: Brightness.light,),
        useMaterial3: true,
          iconTheme: IconThemeData(
            color: Colors.blue.shade200,
          ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue.shade300,
        ),
          primaryTextTheme: TextTheme(
            headline6: GoogleFonts.robotoFlex(
              color: Colors.black),),
          textTheme: TextTheme(
            headline1: GoogleFonts.robotoFlex(
              fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
            headline2: GoogleFonts.robotoFlex(
                fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            headline3: GoogleFonts.robotoFlex(fontSize: 48, fontWeight: FontWeight.w400),
            headline4: GoogleFonts.robotoFlex(
                fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headline5: GoogleFonts.robotoFlex(fontSize: 24, fontWeight: FontWeight.w400),
            headline6: GoogleFonts.robotoFlex(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            subtitle1: GoogleFonts.robotoFlex(
                fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            subtitle2: GoogleFonts.robotoFlex(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyText1: GoogleFonts.robotoFlex(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyText2: GoogleFonts.robotoFlex(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            button: GoogleFonts.robotoFlex(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            caption: GoogleFonts.robotoFlex(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            overline: GoogleFonts.robotoFlex(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),),
          inputDecorationTheme: InputDecorationTheme(
            iconColor: Colors.blue.shade200,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade50),
              borderRadius: BorderRadius.circular(38.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade50),
              borderRadius: BorderRadius.circular(38.0),
            ),
            filled: true,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
            fillColor: Colors.blue.shade50,
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.blue.shade200,
              primary: Colors.black,
              side: BorderSide(color: Colors.blue.shade200),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(38.0),
                ),
              ),
            ),
          ),

      );
  }
}