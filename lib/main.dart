import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Routes/application.dart';
import 'Routes/routes.dart';
import 'Widget/CustomAnimation.dart';




void main(){

  runApp(TaskApp());
  configLoading();
}





class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
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
              primaryColor: Colors.lightBlueAccent
          ),
          builder: EasyLoading.init(),
        )
    );
  }
}
