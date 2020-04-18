import 'package:flutter/material.dart';

class Dialogs {

  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            backgroundColor: Colors.black54,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 10.0,),
                    Text('Connecting...', style: TextStyle(color: Colors.blueAccent),),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  static Future errorDialog(String error, bool visible, BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Text'),
        content: Text(error),
        actions: <Widget>[
          FlatButton(onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'))
        ],
      );
    });
  }

}