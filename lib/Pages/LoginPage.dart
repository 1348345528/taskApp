import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  Widget loginImage(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 150.h),
        height: 300.h,
        width: 300.w,
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
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: null,
          child: Column(
            children: [
              loginImage(),
              // Container(
              //   child: Column(
              //     children: [
              //       Text("用户名"),
              //       Divider(),
              //       Text("密码"),
              //       Divider()
              //     ],
              //   ),
              // ),
              // Container(
              //   child: Text("button"),
              // )
            ],
          ),
        )
    );
  }
}
