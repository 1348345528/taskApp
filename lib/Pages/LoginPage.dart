import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/Config/Config.dart';
import 'package:task/EventBus/EventBus.dart';
import 'package:task/Widget/TaskButton.dart';
import 'package:task/Widget/TaskText.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //用户名
  String _userName;
  //密码
  String _password;
  //报错文本
  String _errorText;

  //_password
  bool loginButton = false;



  //选中事件
  FocusNode _userNameFocus = FocusNode();
  FocusNode _passWordFocus = FocusNode();
  @override
  void initState() {
      super.initState();
      eventBus.on<LoginButtonEvent>().listen((event) {

      });
  }


  Widget loginImage(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 100.h),
        height: 200.h,
        width: 200.w,
        alignment: Alignment.topCenter,
        child: ClipOval(
            child: Container(
              child: Image.asset(
                  'images/haimian.jpeg'
              ),
            )
        ),
      ),
    );
  }

  Widget loginUserNamePassword(){
      return Container(
          width: 700.w,
          child:  Column(
            children: [
              SizedBox(height: 30.h),
              TaskText(
                text:"请输入账号",
                password:false,
                focusNode: _userNameFocus,
                onChanged: (value){
                  setState(() {
                    _userName = value;
                    setState(() {
                      if(null!=_userName&&_userName.isNotEmpty&&null!=_password&&_password.isNotEmpty){
                        loginButton = true;
                      }else{
                        loginButton = false;
                      }
                    });
                  });
                },
              ),
              SizedBox(height: 10.h),
              TaskText(
                text: "请输入密码",
                password: true,
                focusNode: _passWordFocus,
                onChanged: (value){
                  _password=value;
                  setState(() {
                    if(null!=_userName&&_userName.isNotEmpty&&null!=_password&&_password.isNotEmpty){
                      loginButton = true;
                    }else{
                      loginButton = false;
                    }
                  });
                },
              )
            ],
          ),
      );
  }

  _login() async{
    if(loginButton){
      var api = "${Config.host}/oauth/erdp-token";
      var password = Uri.encodeComponent("{erdp}"+encodeBase64(_password));
      api = api + "?username=$_userName&password=$password&rememberMe=true";
      print(api);
      var result = await Dio().post(api,options: Options(
        headers: {
          "contentType": "application/json;charset=utf-8",
          "Authorization":"Basic ZXJkcDpOaVhpbkU3WVRyZDluaDUvUkgxOFBMN3FYMkd6bndvalhmK0preWpNQ0ZUaWVVWFhHZXhtUnplQmdmbHYwdFcrSFpIQjFoZ2dkenpBaFlTK0VUdFFIUjlOSzRnWlBDaGwzUUFmWlZIRm9NVkpzTXdiNWh4c0FlZFJISnN0WGhSSFM3SlIwNXEvZFpMalpWcHFpcXJLWDk0Y2JzbFpDckt5WUx2NHRoY0hxd0k9"
        }
      ));

      if("200"==result.data){
        print("登录成功");
      }else{
        print("登录失败");
      }
    }
  }

  static String encodeBase64(String data){
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: null,
          child: Column(
            children: [
              loginImage(),
              loginUserNamePassword(),
              Container(
                padding: EdgeInsets.only(top: 70.h),
                width: 600.w,
                child: loginButton?FlatButton(
                  color: Colors.blue,
                  height: 100.h,
                  // highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("登录"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: _login,
                ):FlatButton(
                  color: Colors.black26,
                  height: 100.h,
                  // highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("登录"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: _login,
                )
              )
            ],
          ),
        )
    );
  }
}
