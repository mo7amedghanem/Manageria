import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_hr/model/User.dart';
import 'package:my_hr/ui/appTheme.dart';
import 'package:my_hr/widgets/AlertDialog.dart';

class AdvancedSearch extends StatefulWidget {
  AdvancedSearch({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AdvancedSearchState createState() => _AdvancedSearchState();
}

class _AdvancedSearchState extends State<AdvancedSearch> {
  List<User> _userList = [];
  List<User> _searchedList = [];
  TextEditingController controller = new TextEditingController();
  String filter = "";
  Widget appBarTitle = new Text(translate('category.appbar2'));
  Icon actionIcon = new Icon(Icons.search);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    List <User> userList = User.userList;
    for(int i=0; i < userList.length; i++) {
        _userList.add(userList[i]);
    }
    setState(() {
      _userList = userList;
      _searchedList = _userList;
    });
    controller.addListener(() {
      if(controller.text.isEmpty) {
        setState(() {
          filter = "";
          _searchedList = _userList;
        });
      } else {
        setState(() {
          filter = controller.text;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTopAppBar = AppBar(
      backgroundColor: Color(0xff002030),
      elevation: 0.1,
      title: appBarTitle,
      actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: translate('vacation.search'),
                    hintStyle: new TextStyle(color: Colors.white),
                  ),
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  autofocus: true,
                  cursorColor: Colors.white,
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text(translate('category.appbar2'));
                _searchedList = _userList;
                controller.clear();
              }
            });
          },
        ),
      ],
    );

    ListTile personListTile(User user) => ListTile(
      dense: true,
      contentPadding: const EdgeInsets.all(8),
      leading: Container(
        child: ClipRRect(
          child: Image.asset('images/ahmed.jpeg',height: 45,width: 45,),
          borderRadius: BorderRadius.circular(22.5),
        ),
        decoration: customImageShadow,
      ),
      title: Text(user.name1 ,),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(user.name2),],
      ),
      onLongPress: (){
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            name1: user.name1,
            name2: user.name2,
            name3: user.name3,
            name4: user.name4,
          ),
        );
      },
    );

    Container personCard(User person) => Container(child: personListTile(person),);

    if((filter.isNotEmpty)) {
      List<User> user = new List<User>();
      for(int i = 0; i < _searchedList.length; i++) {
        if(_searchedList[i].name1.toLowerCase().contains(filter.toLowerCase())||
            _searchedList[i].name2.toLowerCase().contains(filter.toLowerCase())||
            _searchedList[i].name3.toLowerCase().contains(filter.toLowerCase())) {
          user.add(_searchedList[i]);
        }
      }
      _searchedList = user;
    }

    final appBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _userList == null ? 0 : _searchedList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              personCard(_searchedList[index]),
              Divider()
            ],
          );
        },
      ),
    );

    return  Scaffold(
      appBar: appTopAppBar,
      body: _userList.length == 0 ? Center(
        child: Text(translate('category.results'),style: TextStyle(fontSize: 16),),
      ) :appBody,
    );
  }
}