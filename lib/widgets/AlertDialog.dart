import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String name1,name2,name3,name4;
  const CustomDialog({Key key, this.name1, this.name2, this.name3, this.name4}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        ClipRRect(
          child: Image.asset('images/ahmed.jpeg',height: 120,width: 120,),
          borderRadius: BorderRadius.circular(60),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  widget.name1,
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                  widget.name2,
                  style: TextStyle(fontSize: 12)
              ),
              Text(
                  widget.name3,
                  style: TextStyle(fontSize: 12)
              ),
              Text(
                  widget.name4,
                  style: TextStyle(fontSize: 12)
              ),
            ],
          ),
        ),
      ],
    );
  }
}