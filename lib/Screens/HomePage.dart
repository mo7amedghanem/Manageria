import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/Screens/AboutScreen.dart';
import 'package:my_hr/Screens/Profile.dart';
import 'package:my_hr/Screens/Search.dart';
import 'package:my_hr/model/User.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:my_hr/Screens/Category.dart';
import 'package:my_hr/widgets/drawer_button.dart';
import 'package:my_hr/widgets/translation.dart';
import 'package:provider/provider.dart';

String appBarTitle = translate('category.appbar1');
class HomePage extends StatelessWidget {
  final String name ;
  HomePage({Key key,this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {Provider.of<Users>(context,listen: false).onTabTapped(index);}
    return Scaffold(
      resizeToAvoidBottomPadding: false,
       appBar: AppBar(
        backgroundColor: Provider.of<Users>(context).isToggled? Color(0xff002030): Colors.indigo[900],
        title: Text(Provider.of<Users>(context).currentIndex == 0 ? appBarTitle = translate('category.appbar1'):appBarTitle = translate('category.appbar2')),
        actions: <Widget>[
          Provider.of<Users>(context).currentIndex ==0 ? SizedBox() : IconButton(icon: Icon(Icons.search),color: Colors.white,
              disabledColor: Colors.white, onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdvancedSearch()),);
              }),
          SizedBox(width: 8,),
          Icon(Icons.notifications),
          SizedBox(width: 16,),
        ],
      ),
       drawer:  Drawer(
         child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            SizedBox(height: 48,),
            Row(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    child: Image.asset('images/ahmed.jpeg',height: 50,width: 50,),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  decoration: customImageShadow
                ),
                SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Wrap(children: <Widget>[Text(translate('category.jop'),style: TextStyle(fontSize: 12))],)
                  ],
                )
              ],
            ),
            SizedBox(height: 32,),
            GestureDetector(child: DrawerButton(name:translate('category.language'),widget: Text(translate('category.choosed')),),
              onTap: ()  => onActionSheetPress(context),
            ),
            DrawerButton(
              name: translate('category.mode'),
              widget: CupertinoSwitch(
                activeColor: Colors.indigo[900],
                value: Provider.of<Users>(context,listen: false).isToggled,
                onChanged: (value) {
                  Provider.of<Users>(context,listen: false).changeTheme(value, context);
                  },
              ),
            ),
              GestureDetector(child: DrawerButton(name: translate('vacation.aboutLabel'), widget:SizedBox()),
                onTap: ()  => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()),)),
            ],
          ),
        ),
      ),
      body:  Container( child: Provider.of<Users>(context).currentIndex==0? Profile() : Category(),),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Provider.of<Users>(context).isToggled? Color(0xff002030): Colors.indigo[900],
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail),
                title: Text(translate('category.bnv')),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                title: Text(translate('category.appbar2')),
              ),
            ],
            currentIndex: Provider.of<Users>(context).currentIndex,
            selectedItemColor: offWhite,
            unselectedItemColor: grey2,
            onTap: onTabTapped,
          ),
        ),
      ),
    );
  }
}