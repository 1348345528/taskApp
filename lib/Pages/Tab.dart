import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/Pages/HomePage.dart';
import 'package:task/Util/Storage.dart';

class Tab extends StatefulWidget {
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<Tab> {
  List<Widget> _pageList = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }


  //用户信息抽屉
  Widget userDrawer(){
    return Drawer(
        elevation: 16.0,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('name:xxxx'),
                  accountEmail: Text('email:22222@163.com'),
                  currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('images/haimian.jpeg'),),
                  // otherAccountsPictures: <Widget>[
                  //   CircleAvatar(backgroundImage: AssetImage('images/haimian.jpeg')),
                  //   CircleAvatar(backgroundImage: AssetImage('images/haimian.jpeg')),
                  //   CircleAvatar(backgroundImage: AssetImage('images/haimian.jpeg'))
                  // ],
                  arrowColor: Colors.red,
                  onDetailsPressed: () {
                    print(1);
                  },
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://pic36.nipic.com/20131203/3822951_102145644000_2.jpg'
                        ),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.phone_android_sharp),
                        title: Text("18838291840"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("18838291840"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text("TF"),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.power_settings_new),
                      ),
                      Text('退出')
                    ],
                  ),
                  onTap: () => Navigator.pop(context),
                )
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
          leading: new IconButton(
          icon: new Container(
            padding: EdgeInsets.all(3.0),
            child: new CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("images/haimian.jpeg")),
          ),
          onPressed: (){
            var c= Storage.getString("Authorization");
            print(c);
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: userDrawer(),
      body: HomePage(),
    );
  }
}
