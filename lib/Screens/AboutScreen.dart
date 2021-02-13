import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('vacation.aboutLabel')),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(4),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    translate('vacation.about'),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ClipRRect(
                          child: Image.asset(
                            'images/ahmed.jpeg', fit: BoxFit.fill,
                            height: 150, width: 150,),
                          borderRadius: BorderRadius.circular(75),),
                        Text(
                            translate('category.name'),
                            style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold)),
                        Text(
                          translate('category.jop'),
                          style: TextStyle(fontSize: 12,),),
                        SizedBox(height: 8,),
                        Row(children: <Widget>[
                          ProfileIcons(
                            url: 'images/linkedin.png',
                            function: (){
                              try{
                                launch('https://www.linkedin.com/in/momoghanem');
                              } catch (e){
                                print(e);}},
                          ),
                          SizedBox(width: 16,),
                          ProfileIcons(
                            url: 'images/facebook.png',
                            function: (){
                              try{
                                launch('https://www.facebook.com/mohamedghanem60');
                              } catch (e){
                                print(e);}},
                          ),
                        ],)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ProfileIcons extends StatelessWidget {
  final Function function ;
  final String url ;
  const ProfileIcons({Key key, this.function,this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function ,
      child: ClipRRect(
        child: Image.asset(
          url,
          fit: BoxFit.fill,
          height: 50,
          width: 50,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}