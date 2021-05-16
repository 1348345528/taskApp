import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/Util/Storage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pageList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          child: Text("点击2"),
          onPressed: () async {
            var c = await Storage.getObject("Authorization");
            print(c);
          },
        )
      ],
    );
  }
}
