import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:my_hr/model/User.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:my_hr/widgets/HeadlineWidget.dart';
import 'package:my_hr/widgets/date_widget.dart';
import 'package:my_hr/widgets/toast.dart';
import 'package:my_hr/widgets/vacation_textfield.dart';
import 'package:provider/provider.dart';

class IODPage extends StatelessWidget {
  final String vacationType ;
  IODPage({this.vacationType}) ;
  final TextEditingController _name1 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void dataPicker(){
      Provider.of<Users>(context,listen: false).when = DateTime.now() ;
      Provider.of<Users>(context,listen: false).when2 = DateTime.now() ;}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(vacationType),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              HeadlineWidget(),
              VacationTextFormField( secure: false,hintName: translate('request.days'),icon: Icon(Icons.plus_one,color: offWhite,),
                  inputType: TextInputType.datetime,controller: _name1),
              SizedBox(height: 8,),
              DateWidget(
                pick: "${translate('vacation.pick1')} : ",
                date: DateFormat("dd/MM/yyyy").format(Provider.of<Users>(context).when),
                function: (){Provider.of<Users>(context,listen: false).datePicker(context: context);},),
              SizedBox(height: 8,),
              DateWidget(
                pick: "${translate('vacation.pick2')} : ",
                date: DateFormat("dd/MM/yyyy").format(Provider.of<Users>(context).when2),
                function: (){Provider.of<Users>(context,listen: false).datePicker2(context: context,);},),
              SizedBox(height: 32,),
              Container(
                width: 120,
                child:FlatButton.icon(onPressed: (){
                    if(_name1.text.isNotEmpty&&int.parse(_name1.text.toString())>0){
                      Provider.of<Users>(context,listen: false).add(
                        name1: translate('vacation.vac') +' ' + '($vacationType)',
                        name2: translate('category.name') + translate('vacation.desc') +
                            DateFormat("dd/MM").format(Provider.of<Users>(context,listen: false).when)+'\n' +translate('vacation.to') +
                            DateFormat("dd/MM").format( DateTime.utc(1,Provider.of<Users>(context,listen: false).when.month,(Provider.of<Users>(context,listen: false).when.day+int.parse(_name1.text.toString())))) +
                            translate('vacation.day') +DateFormat("dd/MM").format( DateTime.utc(1,Provider.of<Users>(context,listen: false).when2.month,(Provider.of<Users>(context,listen: false).when2.day))),
                        name3: translate('request.days') + ' : '+ _name1.text,
                        name4: '',
                      );
                      dataPicker();
                      Navigator.of(context).pop();
                    }else
                    {ShowToast.showDialog(translate('vacation.toast1'), context);}
                  },
                  label: Text(translate('request.send'),style: TextStyle(color: offWhite),),
                  icon: Icon(Icons.send,color: offWhite,),
                    color: Colors.deepPurple[900],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}