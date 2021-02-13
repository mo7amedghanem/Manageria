import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/model/User.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_hr/widgets/AlertDialog.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List <User> usersList = Provider.of<Users>(context).list() ;
    return usersList.length == 0 ? Center(
      child: Text(translate('category.results'),style: TextStyle(fontSize: 16),),
    ) : Container(
        child: ListView.builder(
          itemCount: usersList.length,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              delegate:  SlidableDrawerDelegate(),
              actionExtentRatio: 0.25,
              child: Column(
                children: <Widget>[
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.all(8),
                    leading: Container(
                      child: ClipRRect(
                        child: Image.asset('images/ahmed.jpeg',height: 45,width: 45,),
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                      decoration: customImageShadow
                    ),
                    title: Text(usersList[index].name1),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(usersList[index].name2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            FlatButton(
                              disabledTextColor: Colors.white,
                              onPressed:  () {
                                  Provider.of<Users>(context,listen: false).buttonOneState();
                              },
                              child: Text(Provider.of<Users>(context).buttonState1,
                                style: TextStyle(color: Provider.of<Users>(context).buttonOne),),
                            ),
                            FlatButton(
                              disabledTextColor: Colors.white,
                              onPressed: () {
                                  Provider.of<Users>(context,listen: false).buttonTwoState();
                                  },
                              child: Text(Provider.of<Users>(context).buttonState2,
                                style: TextStyle(color: Provider.of<Users>(context).buttonTwo),),
                            ),
                        ],
                        ),
                      ],
                    ),
                    onLongPress: (){
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          name1:usersList[index].name1,
                          name2: usersList[index].name2,
                          name3: usersList[index].name3,
                          name4: usersList[index].name4,
                        ),
                      );
                    },
                  ),
                  Divider()
                ],
              ),
              secondaryActions: <Widget>[
                 IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: (){
                    Provider.of<Users>(context,listen: false).deleteItem(index);
                    },
                ),
              ],
            );
          },
        ),
    );
  }
}