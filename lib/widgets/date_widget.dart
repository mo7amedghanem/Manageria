import 'package:flutter/material.dart';
import 'package:my_hr/ui/appTheme.dart';

class DateWidget extends StatelessWidget {
  final Function function ;
  final String pick ;
  final String date ;
  const DateWidget({Key key, this.function, this.pick, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customTextFieldShadow,
      height: 50,
      child: RaisedButton(
          color: Colors.indigo[400],
          child: Row(
            children: <Widget>[
              Icon(Icons.date_range,color: offWhite),
              SizedBox(width: 16,),
              Text(pick,style: TextStyle(color: offWhite),),
              Text(date,style: TextStyle(color: offWhite),),
            ],
          ),
          onPressed: function
      ),
    );
  }
}
