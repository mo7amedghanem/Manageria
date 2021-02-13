import 'package:flutter/material.dart';

//colors

const Color darkBlue = Color(0xff333E4A);
const Color grey1 = Color(0xffDADBDD);
const Color grey2 = Color(0xff3E4A7F);
const Color offWhite = Color(0xffF9F9F9);

 BoxDecoration customLogoShadow = BoxDecoration(
    boxShadow: [ BoxShadow(color: Colors.black87, blurRadius: 20.0,),],
  borderRadius: BorderRadius.circular(78)
);

 BoxDecoration customTextFieldShadow = BoxDecoration(
     color: Colors.indigo[400],
     boxShadow: [
       BoxShadow(
           color:  Colors.black87,
           blurRadius:3,
       )
     ],
 );

 BoxDecoration customImageShadow = BoxDecoration(
     borderRadius: BorderRadius.circular(25),
     boxShadow: [BoxShadow(color: Colors.black87, blurRadius:3,)]
 );


ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: grey1,
    primaryColor: grey1,
    accentColor: offWhite,
    platform: TargetPlatform.android,
    fontFamily: 'font1'
);
