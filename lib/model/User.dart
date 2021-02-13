import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:my_hr/widgets/dynamic_theme.dart';
class User {
  static List<User> userList = Users.usersList;
  final String name1, name2, name3, name4;
  User({this.name1, this.name2, this.name3, this.name4});
}

class Users with ChangeNotifier {
  static List<User> usersList = [];
  int currentIndex = 0;
  bool isToggled = false ;
  DateTime when = DateTime.now();
  DateTime when2 = DateTime.now();
  String selectedLocation;
  Color buttonOne = Colors.blue;
  Color buttonTwo = Colors.red;
  String buttonState1 ='Accept';
  String buttonState2 ='Decline';
  File image;

  List list(){
    return usersList ;
  }

  void add({String name1, String name2, String name3, String name4}) {
    usersList.add(User(name1: name1, name2: name2, name3: name3, name4: name4));
    notifyListeners();
  }

  void datePicker({BuildContext context}) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: when,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      when = picked;
    }
    notifyListeners();
  }
  void datePicker2({BuildContext context}) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: when2,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      when2 = picked;
    }
    notifyListeners();
  }

  Future getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().getImage(source: src);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    } else {
      print('No Image Selected');
    }
    notifyListeners();
  }

  void onTabTapped(int index) {
    currentIndex = index;
      notifyListeners();
  }

  void changeTheme(bool value,BuildContext context) {
    isToggled = value ;
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light);
    notifyListeners();
  }

  void selectLocation(String index) {
    selectedLocation = index;
    notifyListeners();
  }

  void deleteItem(int index) {
    usersList.removeAt(index);
    notifyListeners();
  }

  void buttonOneState () {
    buttonOne = (buttonOne == Colors.blue ? Colors.green : Colors.green);
    buttonTwo =( buttonTwo == Colors.blue ? grey1 : grey1) ;
    buttonState1 =  (buttonState1==translate('request.accepted') ? translate('request.accepted') : translate('request.accepted'));
    buttonState2 = (buttonState2== translate('request.decline')? translate('request.decline') : translate('request.decline'));
    notifyListeners();
  }
  void buttonTwoState () {
    buttonTwo = (buttonOne == Colors.blue ? Colors.blue : Colors.red);
    buttonOne = (buttonOne == Colors.red ? Colors.red : Colors.grey);
    buttonState2 =  (buttonState2==translate('request.declined') ? translate('request.declined') : translate('request.declined'));
    buttonState1 =  (buttonState1==translate('request.accept') ? translate('request.accept') : translate('request.accept'));
    notifyListeners();
  }
}