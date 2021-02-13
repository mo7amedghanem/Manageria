import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_hr/ui/appTheme.dart';

class VacationTextFormField extends StatelessWidget {
  final String hintName ;
  final FormFieldValidator validator ;
  final TextEditingController controller ;
  final bool secure ;
  final bool enable ;
  final Icon icon ;
  final ValueChanged<String> change;
  final TextInputType inputType ;
  const VacationTextFormField({Key key, this.hintName,this.icon,
    this.controller,@required this.secure,this.inputType,  this.validator, this.change,this.enable}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      child: TextFormField(
        validator : validator,
        onChanged: change,
        enabled: enable,
        obscureText: secure,
        style: TextStyle(fontSize: 14,color: offWhite),
        maxLines: 1,
        decoration:
        InputDecoration(
          fillColor: offWhite,
          labelText:hintName ,
          labelStyle: TextStyle(color: offWhite),
          icon: icon,
            border: InputBorder.none,
            hintStyle: TextStyle(color: offWhite),
        ),
        controller: controller,
        keyboardType: inputType,
      ),
      decoration: customTextFieldShadow
    );
  }
}