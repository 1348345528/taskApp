import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Routes/application.dart';
import 'Routes/routes.dart';




void main(){

  runApp(TaskApp());
}





class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {

  _TaskAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        builder:()=> MaterialApp(
          debugShowCheckedModeBanner:  false,
          onGenerateRoute: Application.router.generator,
          theme: ThemeData(
              primaryColor: Colors.white
          ),
        )
    );
  }
}
