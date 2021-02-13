import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/Screens/HomePage.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:my_hr/widgets/custom_button.dart';
import 'package:my_hr/widgets/custom_textfield.dart';

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            margin: EdgeInsets.only(top:32),
            padding: EdgeInsets.only(right: 32, left: 32),
            child: Form(
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: ClipRRect(
                              child: Image.asset(
                                'images/mylogo.png',
                                fit: BoxFit.fill,
                                height: 150,
                                width: 150,
                              ),
                              borderRadius: BorderRadius.circular(75),
                            ),
                            decoration: customLogoShadow
                          ),
                          SizedBox(height: 6,),
                          Text(translate('login.loginLabel'),
                              style: TextStyle(
                                  fontSize: 24, ))
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CustomTextFormField(
                            controller: emailController,
                            hintName: translate('login.email'),
                            color: offWhite,
                            secure: false,
                            color3: darkBlue,
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 12)),
                          CustomTextFormField(
                            controller: passwordController,
                            hintName: translate('login.password'),
                            color: offWhite,
                            secure: true,
                            color3: darkBlue,
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 12)),
                          Padding(padding: EdgeInsets.only(bottom: 12))
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomButton(
                              onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(name: translate('category.name'),),),);},
                              name: translate('login.enter'),
                              color: Colors.indigo[900],
                              color2: offWhite,
                              color3: darkBlue,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ));
  }
}