


import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/Pages/HomePage.dart';
import 'package:task/Pages/LoginPage.dart';

var rootHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> params){
  return HomePage();
});

var loginHandler = Handler(handlerFunc: (BuildContext context,Map<String,List<String>> params){
  return LoginPage();
});