import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage{

  static Future<void> setString(key,value) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       sp.setString(key, value);
  }
  static Future<Object> getObject(key) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       return sp.get(key);
  }
  static Future<void> remove(key) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       sp.remove(key);
  }
  static Future<void> clear() async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       sp.clear();
  }


}