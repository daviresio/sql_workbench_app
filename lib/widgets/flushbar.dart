import 'package:emojis/emoji.dart';
import 'package:emojis/emojis.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ShowFlushbar {

  static void saved(BuildContext context, {String message = 'Register saved successfull!'}) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
//    return Flushbar(message: message,);
  }

  static Flushbar success({String message}) {
    return Flushbar(message: message, duration: Duration(seconds: 3),
        icon: Padding(padding: const EdgeInsets.all(12.0), child: Text(Emoji.byChar(Emojis.partyPopper).char, style: TextStyle(fontSize: 22.0),),
    ));
  }

  static Flushbar error({String message}) {
    return Flushbar(messageText: Text(message, style: TextStyle(color: Colors.redAccent),), duration: Duration(seconds: 3),
        icon: Padding(padding: const EdgeInsets.all(12.0), child: Text(Emoji.byChar(Emojis.seeNoEvilMonkey).char, style: TextStyle(fontSize: 22.0),),
    ));
  }

  static void updated(BuildContext context, {String message = 'Register updated successfull!',}) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  static void deleted(BuildContext context, {String message = 'Register deleted successfull!',}) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  static Flushbar copied({String message = 'Copied to clipboard!',}) {
    return Flushbar(message: message, duration: Duration(seconds: 3),
        icon: Padding(padding: const EdgeInsets.all(12.0), child: Text(Emoji.byChar(Emojis.fileFolder).char, style: TextStyle(fontSize: 22.0),),
        ));
  }

}