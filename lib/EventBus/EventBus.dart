
import 'dart:ui';

import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class  LoginButtonEvent{
  Color color;
  String text;

  LoginButtonEvent(Color color,String text){
    color = color;
    text = text;
  }

}