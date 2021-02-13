import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/model/User.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:my_hr/widgets/HeadlineWidget.dart';
import 'package:my_hr/widgets/toast.dart';
import 'package:my_hr/widgets/vacation_textfield.dart';
import 'package:provider/provider.dart';

class MissionPage extends StatelessWidget {
  final bool button = false;
  final DateTime when = DateTime.now();
  final _name1 = TextEditingController();
  final _name2 = TextEditingController();
  final _name3 = TextEditingController();
  final _name4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(translate('vacation.mission')),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              HeadlineWidget(),
              VacationTextFormField( secure: false,hintName: translate('request.location'),
               controller: _name1,icon: Icon(Icons.location_on,color: offWhite),),
              SizedBox(height: 24,),
              VacationTextFormField( secure: false,hintName: translate('request.days'),
                inputType: TextInputType.number,controller: _name2,icon: Icon(Icons.plus_one,color: offWhite)),
              SizedBox(height: 24,),
              VacationTextFormField( secure: false,hintName: translate('request.reason'),
               controller: _name3,icon: Icon(Icons.assignment,color: offWhite)),
              SizedBox(height: 24,),
              VacationTextFormField( secure: false,hintName: translate('request.transport'),
                controller: _name4,icon: Icon(Icons.directions_car,color: offWhite,)),
              SizedBox(height: 32,),
              Container(
                width: 120,
                child:FlatButton.icon(onPressed: ()async{
                    if(_name1.text.isNotEmpty&&_name2.text.isNotEmpty&&_name3.text.isNotEmpty&&_name4.text.isNotEmpty){
                      Provider.of<Users>(context,listen: false).add(
                        name1: translate('vacation.missionTo') + _name1.text,
                        name2: translate('request.reason') + ' : '+_name3.text,
                        name3: translate('request.days') + ' : '+_name2.text,
                        name4: translate('request.transport') + ' : '+_name4.text,
                      );
                      Navigator.of(context).pop();
                    } else
                    {ShowToast.showDialog(translate('vacation.toast2'), context);}
                    },
                  label: Text(translate('request.send'),style: TextStyle(color: offWhite),),
                  icon: Icon(Icons.send,color: offWhite,),
                    color: Colors.deepPurple[900],
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}