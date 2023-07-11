

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SnackBarWidget{

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text){
    if(text == null) return;

    final snackbar = SnackBar(content: text.text.make());

    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackbar);
  }
}