import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/Screens/LoginPage.dart';
import 'package:my_hr/ui/appTheme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginPage())));}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          children: <Widget>[
            Expanded(flex: 3,child: SizedBox(),),
            Expanded(
              flex: 6,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(75.0),
                      child: Image.asset('images/mylogo.png', width: 150.0,
                        height: 150.0, fit: BoxFit.fill,),),
                    decoration:  customLogoShadow
                  ),
                ],
              ),
            ),
            Expanded(flex: 10,child: SizedBox(),),
            Expanded(flex: 1, child: Text("From",style: TextStyle(fontSize: 14,color: Colors.grey))),
            Expanded(flex: 1, child: Text(translate('category.name'),style: TextStyle(fontSize: 18,color: Colors.indigo[900]))),
            Expanded(flex: 2,child: SizedBox(),),
          ],
        ),
      ),
    );
  }
}