import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/Entity/User.dart';
import 'package:task/Pages/HomePage.dart';
import 'package:task/Pages/MyWorkSpace.dart';
import 'package:task/Routes/application.dart';
import 'package:task/Util/DioManager.dart';
import 'package:task/Util/NWMethod.dart';
import 'package:task/Util/Storage.dart';

class Tab extends StatefulWidget {

  Map<String,List<String>> params;
  @override
  _TabState createState() => _TabState();

  Tab(this.params);
}

class _TabState extends State<Tab> {
  List<Widget> _pageList = [
    MyWorkSpacePage(),
    HomePage()
  ];

  List<String> _bottomString = ["个人工作站","任务管理"];
  int _currentIndex = 1;
  var _pageController;

  //用户信息
  User user = null;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //传递对象
    print(widget.params["userInfo"][0]);
    user=User.fromJson(json.decode(widget.params["userInfo"][0]));

    _pageController = PageController(initialPage: _currentIndex);
  }

  //获取用户信息
  userDetail() async{
    Object c= await Storage.getObject("userInfo");
    print(c);
    Map map = json.decode(c);
    var api = "/common/user/"+map["id"]+"?appId=utask";
    DioManager().request<User>(
      method: NWMethod.GET,
      api: api,
      success: (data){
        setState(() {
          user = data;
        });
      },

    );
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
                  accountName: Text("姓名："+user.displayName!=null?user.displayName:""),
                  accountEmail: Text("邮箱:" +user.email!=null?user.email:""),
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
                        title: Text(user.phone!=null?user.phone:""),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text(user.tell!=null?user.tell:""),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text(user.orgName!=null?user.orgName:""),
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
                  onTap: () => Application.router.navigateTo(context, "/",replace: true)
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
            userDetail();
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Container(
          padding: EdgeInsets.only(left: 140.w),
          child: Text(_bottomString[_currentIndex]),
        ),
      ),
      drawer: userDrawer(),
      body: PageView(
        controller: _pageController,
        children: _pageList,
        onPageChanged: (index){
          setState(() {
            this._currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              title: Text("个人工作站")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("任务管理")
          ),
        ],
      ),
    );
  }
}
