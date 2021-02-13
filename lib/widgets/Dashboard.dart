import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String vacationTitle ;
  final String days ;
  final String fixedNumber ;
  final double width ;
  final Function function ;
  const Dashboard({Key key, this.vacationTitle, this.days,this.width,this.fixedNumber,this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:80,
      width: width,
      child: FlatButton(
        padding: EdgeInsets.all(8),
        onPressed: function,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(vacationTitle ,style: TextStyle(fontSize: 15),),
                Text(days + ' / '+ fixedNumber,style: TextStyle(fontSize: 15),),
              ]
          ),
      ),
      decoration: BoxDecoration(
          color: Colors.indigo[400],
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black87,
                blurRadius:1.5,
            )
          ]
      ),
    );
  }
}