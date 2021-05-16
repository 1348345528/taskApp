


import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/Pages/HomePage.dart';
import 'package:task/Pages/LoginPage.dart';
import 'package:task/Pages/MyWorkSpace.dart';
import 'package:task/Pages/Tab.dart';

var rootHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> params){
  return Tab(params);
});

var loginHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>>params){
  return LoginPage();
});

var myWorkSpaceHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>>params){
  return MyWorkSpacePage();
});