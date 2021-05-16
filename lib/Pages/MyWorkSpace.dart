import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/Util/Storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWorkSpacePage extends StatefulWidget {
  @override
  _MyWorkSpacePageState createState() => _MyWorkSpacePageState();
}

class _MyWorkSpacePageState extends State<MyWorkSpacePage> {
  List<String> _gridList = [
    "待办工作包",
    "代管工作包",
    "监理工作包",
    "已删工作包",
    "任务发布",
    "待办任务",
    "协办事项",
    "待转出任务",
    "待转入任务",
    "任务回顾",
    "我的日历",
    "工作包收藏",
    "相关服务"
  ];

  //标题
  Widget titleWidget(value) {
    return Container(
      height: 20.h,
      margin: EdgeInsets.only(left: 10.w),
      padding: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.red, width: 5.w))),
      child: Text(
        value,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisSpacing: 10.w),
        itemCount: _gridList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(_gridList[index]);
            },
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: Image.asset('images/haimian.jpeg'),
                    )
                ),
                Expanded(
                  flex: 1,
                  child: Text(_gridList[index]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
