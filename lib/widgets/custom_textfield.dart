import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintName ;
  final FormFieldValidator validator ;
  final TextEditingController controller ;
//  final TextDirection directionality;
  final Color color ;
  final Color color3 ;
  final bool secure ;
  final ValueChanged<String> change;
  final TextInputType inputType ;
  const CustomTextFormField({Key key, this.hintName,
    @required this.color3,
    this.controller,@required this.secure,this.inputType, this.color, this.validator, this.change}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 50,
        child: TextFormField(
          validator : validator,
          onChanged: change,
          obscureText: secure,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15,color: Color(0xff002030)),
          maxLines: 1,
          decoration:
          InputDecoration(
              helperStyle: TextStyle(fontFamily: 'Bahij'),
              border: InputBorder.none,
              hintText: (hintName),
              hintStyle: TextStyle(color: Color(0xff002030))
          ),
          controller: controller,
          keyboardType: inputType,
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color:  color3,
                  blurRadius:40,
                  offset: Offset(0, 4),
                  spreadRadius: -15
              )
            ]
        ),

    );
  }
}