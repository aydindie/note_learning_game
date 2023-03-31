 import 'package:flutter/material.dart';

 ThemeData get darkTheme {
  return ThemeData(
   // primaryColor: CustomColors.darkGrey,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Montserrat',
    textTheme: ThemeData.dark().textTheme,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
     // buttonColor: CustomColors.lightPurple
      
    )
  );
}