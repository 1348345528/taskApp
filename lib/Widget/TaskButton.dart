import 'package:flutter/material.dart';


class TaskButton extends StatefulWidget {
  Color color;
  String text;
  Object cb;
  double height;
  TaskButton({Key key,this.color=Colors.blue,this.text="按钮",this.cb=null,this.height=68}) : super(key: key);

  @override
  _TaskButtonState createState() => _TaskButtonState();
}

class _TaskButtonState extends State<TaskButton> {



  @override
  Widget build(BuildContext context) {

    return FlatButton(
      color: widget.color,
      height: widget.height,
      // highlightColor: Colors.blue[700],
      colorBrightness: Brightness.dark,
      splashColor: Colors.grey,
      child: Text(widget.text),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: widget.cb,
    );
  }
}









// class TaskButton extends StatelessWidget {
//
//   final Color color;
//   final String text;
//   final Object cb;
//   final double height;
//   TaskButton({Key key,this.color=Colors.black26,this.text="按钮",this.cb=null,this.height=68}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       color: color,
//       height: height,
//       highlightColor: Colors.blue[700],
//       colorBrightness: Brightness.dark,
//       splashColor: Colors.grey,
//       child: Text(text),
//       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//       onPressed: cb,
//     );
//
//     // return InkWell(
//     //   onTap: this.cb,
//     //   child: Container(
//     //     margin: EdgeInsets.all(5.w),
//     //     padding: EdgeInsets.all(5.w),
//     //     height: height.h,
//     //     width: double.infinity,
//     //     decoration: BoxDecoration(
//     //         color: color,
//     //         borderRadius: BorderRadius.circular(10)),
//     //     child: Center(
//     //       child: Text(
//     //         "${text}",
//     //         style: TextStyle(color: Colors.white),
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }
