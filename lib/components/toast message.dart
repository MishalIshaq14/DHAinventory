import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class message{
  void toastmessage(String text){
    Fluttertoast.showToast(

        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}