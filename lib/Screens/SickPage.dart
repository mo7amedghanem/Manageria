import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:my_hr/model/User.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:my_hr/widgets/HeadlineWidget.dart';
import 'package:my_hr/widgets/date_widget.dart';
import 'package:my_hr/widgets/toast.dart';
import 'package:my_hr/widgets/vacation_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SickPage extends StatelessWidget {
  final String vacationType ;
  SickPage({Key key, this.vacationType}) : super(key: key);
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
                date: DateFormat("dd/MM/yyyy").format(Provider.of<Users>(context,listen: true).when),
                function: (){Provider.of<Users>(context,listen: false).datePicker(context: context,);},),
              SizedBox(height: 8,),
                    Container(
                      decoration: customTextFieldShadow,
                      child: GestureDetector(
                          onTap: (){
                            var photoAlertDialog = AlertDialog(
                              title: Text(translate('vacation.alertHeadline')),
                              content: Container(
                                height: 150 ,
                                child: Column(
                                  children: <Widget>[
                                    Divider(color: Colors.grey,),
                                    Container(
                                      width: 300,
                                      color: Colors.indigo[400],
                                      child: ListTile(
                                        leading: Icon(Icons.image),
                                        title: Text(translate('vacation.alert1')),
                                        onTap: (){
                                          Provider.of<Users>(context,listen: false).getImage(ImageSource.gallery);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 300,
                                      color: Colors.indigo[400],
                                      child: ListTile(
                                        leading: Icon(Icons.add_a_photo),
                                        title: Text(translate('vacation.alert2')),
                                        onTap: (){
                                          Provider.of<Users>(context,listen: false).getImage(ImageSource.camera);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context,child: photoAlertDialog);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                                color: Colors.indigo[400],
                                height: 50,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.camera_alt,color: offWhite,),
                                    SizedBox(width: 12,),
                                    Text(translate('vacation.take'),style: TextStyle(fontSize: 16,color: offWhite),),
                                  ],
                                ),
                              ),
                      ),
                    ),
              SizedBox(height: 32,),
                  Container(
                    width: 120,
                    child: FlatButton.icon(
                      onPressed: ()  {
                      if(_name1.text.isNotEmpty&&int.parse(_name1.text.toString())>0){
                        Provider.of<Users>(context,listen: false).add(
                          name1: translate('vacation.vac') +' ' + '($vacationType)',
                          name2: translate('category.name') + translate('vacation.desc') +
                              DateFormat("dd/MM").format(Provider.of<Users>(context,listen: false).when) +'\n'+ translate('vacation.to') +
                              DateFormat("dd/MM").format( DateTime.utc(1,Provider.of<Users>(context,listen: false).when.month,(Provider.of<Users>(context,listen: false).when.day+int.parse(_name1.text.toString())))),
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
              SizedBox(height: 8,),
              Provider.of<Users>(context).image == null ?
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(color: Colors.transparent,border: Border.all(color: Colors.indigo[400],
                      width: 1.0),borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:15),
                      Icon(Icons.camera_alt, color: Colors.indigo[400],),
                      SizedBox(height: 5),
                      Text(translate('vacation.photo'), style: TextStyle(color: Colors.indigo[400],)),
                      SizedBox(height: 15)
                    ],
                  )) : Container(
                  height:150,
                  width:150,
                  child: Image.file(Provider.of<Users>(context).image,fit: BoxFit.cover,)),
            ],
          ),
        ),
      ),
    );
  }
}