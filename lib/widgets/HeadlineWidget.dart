import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/ui/appTheme.dart';

class HeadlineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Icon(Icons.date_range,size: 64,),),
        SizedBox(height: 8,),
        Container(
          height: 80,
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
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(translate('category.sector'),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text(translate('category.manager'),),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}