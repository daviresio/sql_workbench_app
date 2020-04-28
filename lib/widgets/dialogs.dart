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
            backgroundColor: Colors.white,
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
        title: Text('Erro'),
        content: Text(error),
        actions: <Widget>[
          FlatButton(onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'))
        ],
      );
    });
  }

  static Future<bool> deleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Danger', style: TextStyle(color: Colors.redAccent),),
          content: Text('Are you sure you want to delete this record?'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('NO', style: TextStyle(color: Colors.blueAccent),),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('YES', style: TextStyle(color: Colors.redAccent),),
            ),
          ],
        );
      }
    );
  }
  
}