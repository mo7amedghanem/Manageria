import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/main.dart';
void showDemoActionSheet({BuildContext context, Widget child}) {
  showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child).then((String value)
  {
    changeLocale(context, value);
  });
}
void onActionSheetPress(BuildContext context) {
  showDemoActionSheet(
    context: context,
    child: CupertinoActionSheet(
      title: Text(translate('language.selection.title')),
      message: Text(translate('language.selection.message')),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child:  Text(translate('language.name.en')),
          onPressed: () {
            Navigator.pop((context), 'en_US');
            },),
        CupertinoActionSheetAction(
            child:  Text(translate('language.name.ar')),
            onPressed: (){
              Navigator.pop(context, 'ar');}),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(translate('category.cancel')),
        isDefaultAction: true,
        onPressed: () => Navigator.pop(context, null),
      ),
    ),
  );
}