import 'package:dbclientapp/database/database.dart';
import 'package:flutter/material.dart';

Future<dynamic> showEditFavoriteDialog(BuildContext context, QuerySaved item) {

  TextEditingController _controller = TextEditingController(text: item.query);

  return showDialog(context: context, builder: (context) => AlertDialog(
    content: TextField(
      decoration: InputDecoration(
        labelText: 'Query'
      ),
      controller: _controller,
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop(false);
        },
        child: Text('CANCEL', style: TextStyle(color: Colors.redAccent),),
      ),
      FlatButton(
        onPressed: () async {
          await Database.instance.querySavedDao.edit(item.copyWith(query: _controller.text));
          Navigator.of(context).pop(true);
        },
        child: Text('SAVE', style: TextStyle(color: Colors.blueAccent),),
      ),
    ],
  ));
}