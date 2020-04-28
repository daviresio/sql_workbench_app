import 'package:flutter/material.dart';

class ShowFlushbar {

  static void saved(BuildContext context, {String message = 'Register saved successfull!'}) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
//    return Flushbar(message: message,);
  }

  static void updated(BuildContext context, {String message = 'Register updated successfull!',}) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  static void deleted(BuildContext context, {String message = 'Register deleted successfull!',}) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

}