import 'package:flutter/material.dart';
class DrawerButton extends StatelessWidget {
  final Widget widget ;
  final String name ;
  const DrawerButton({Key key, this.widget,this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bahij')),
          widget,
        ],
      ),
    );
  }
}