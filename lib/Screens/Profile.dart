import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/Screens/IODPage.dart';
import 'package:my_hr/Screens/MissionPage.dart';
import 'package:my_hr/Screens/OtherPage.dart';
import 'package:my_hr/Screens/SickPage.dart';
import 'package:my_hr/Screens/VacationPage.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:my_hr/widgets/Dashboard.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData ;
    queryData = MediaQuery.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 4,),
            Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height:60,
                        width:60,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Center(child: Text('22',style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 3,color: grey1)
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(translate('category.sector'),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text(translate('category.manager'),),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Column(children: <Widget>[
                Dashboard(vacationTitle: translate('vacation.accidental'),days: '3',fixedNumber:'6',width: ((queryData.size.width/2) - 25),function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VacationPage(vacationType: translate('vacation.accidental'),)),);
                },),
                SizedBox(height: 8,),
                Dashboard(vacationTitle: translate('vacation.iod'),days: '11',fixedNumber:'30',width: ((queryData.size.width/2) - 25) ,function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => IODPage(vacationType: translate('vacation.iod')),));
                },),
                SizedBox(height: 8,),
                Dashboard(vacationTitle: translate('vacation.other'),days: '11',fixedNumber:'30',width: ((queryData.size.width/2) - 25),function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtherPage(vacationType:  translate('vacation.other'),
                  )),);
                },),
              ],
              ),
              Column(children: <Widget>[
                Dashboard(vacationTitle: translate('vacation.normal'),days: '5',fixedNumber:'15',width: ((queryData.size.width/2) - 25),function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VacationPage(vacationType: translate('vacation.normal'),)),);},),
                SizedBox(height: 8,),
                Dashboard(vacationTitle: translate('vacation.sick'),days: '1',fixedNumber:'5',width: ((queryData.size.width/2) - 25),function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SickPage(vacationType: translate('vacation.sick'),)),);},),
                SizedBox(height: 8,),
                Dashboard(vacationTitle: translate('vacation.administrative'),days: '2',fixedNumber:'4',width:((queryData.size.width/2) - 25),function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VacationPage(vacationType: translate('vacation.administrative'))),);
                },),
              ],
              ),
            ],
            ),
            SizedBox(height: 8,),
            Dashboard(vacationTitle: translate('vacation.mission'),days: '11',fixedNumber:'30',width: double.infinity,function: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MissionPage()),);
            },),
          ],
        ),
      ),
    );
  }
}