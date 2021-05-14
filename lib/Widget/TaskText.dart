import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskText extends StatelessWidget {

  final String text;
  final bool password;
  final Object onChanged;
  final Icon icon;
  final FocusNode focusNode;
  TaskText({Key key,this.text="输入内容",this.password=false,this.onChanged=null,this.icon=null,this.focusNode=null}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: this.password,
        focusNode: focusNode,
        decoration: InputDecoration(
            icon: icon,
            hintText: this.text,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
            )),
        onChanged: this.onChanged,
      ),
      height: 130.h,
    );
  }
}
