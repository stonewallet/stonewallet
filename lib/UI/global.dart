import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void alert(String alert){
  Fluttertoast.showToast(
    msg: alert,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.indigo,);
}