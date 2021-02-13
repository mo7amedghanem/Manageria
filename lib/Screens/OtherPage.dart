import 'package:flutter/cupertino.dart';
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

class OtherPage extends StatelessWidget {
  final String vacationType ;
  final Function function ;
  OtherPage({Key key, this.vacationType,this.function}) : super(key: key);
   final List<String> _locations = [translate('vacation.wedding'), translate('vacation.marriage'), translate('vacation.death')]; // Option 2
   final TextEditingController _name1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void dataPicker(){
      Provider.of<Users>(context,listen: false).when = DateTime.now() ;
    }
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
                pick: "${translate('request.enter')} : ",
                date: DateFormat("dd/MM/yyyy").format(Provider.of<Users>(context).when),
                function: (){Provider.of<Users>(context,listen: false).datePicker(context: context,);},),
              SizedBox(height: 8,),
              Container(
                decoration: customTextFieldShadow,
                padding: EdgeInsets.only(left: 16),
                height: 50,
                width: double.infinity,

                child: DropdownButton(
                  style: TextStyle(color: grey2,fontSize: 16),
                  iconEnabledColor: offWhite,
                  hint: Text(translate('vacation.choose'), style: TextStyle(color: offWhite),), // Not necessary for Option 1
                  value: Provider.of<Users>(context).selectedLocation,
                  onChanged: (newValue) {
                    Provider.of<Users>(context,listen: false).selectLocation(newValue);
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child:  Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 32,),
              Container(
                width: 120,
                child:  FlatButton.icon(onPressed: ()async{
                    if(_name1.text.isNotEmpty&&int.parse(_name1.text.toString())>0
                        &&(Provider.of<Users>(context,listen: false).selectedLocation==_locations[0]||
                            Provider.of<Users>(context,listen: false).selectedLocation==_locations[1]||
                            Provider.of<Users>(context,listen: false).selectedLocation==_locations[2])
                    ){
                      Provider.of<Users>(context,listen: false).add(
                        name1: translate('vacation.vac') +' ' + '($vacationType)',
                        name2: translate('category.name') + translate('vacation.desc') +
                            DateFormat("dd/MM").format(Provider.of<Users>(context,listen: false).when) +'\n'+ translate('vacation.to') +
                            DateFormat("dd/MM").format( DateTime.utc(1,Provider.of<Users>(context,listen: false).when.month,(Provider.of<Users>(context,listen: false).when.day+int.parse(_name1.text.toString())))) +
                            translate('vacation.for') + Provider.of<Users>(context,listen: false).selectedLocation,
                        name3: translate('request.days') + ' : '+ _name1.text,
                        name4: '',
                      );
                      dataPicker();

                      Navigator.of(context).pop();
                    }else
                    {ShowToast.showDialog(translate('vacation.toast2'), context);}},
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