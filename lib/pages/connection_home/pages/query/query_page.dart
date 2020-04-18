import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {

  final GlobalKey<State> _globalKey = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
//                        contentPadding: EdgeInsets.only(left: 8.0, right: 8.0),
                        labelText: 'Query',
                        suffix: GestureDetector(
                          child: Icon(Icons.close),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text('SAVE'),
                        onPressed: () {

                        },
                      ),
                      FlatButton(
                        child: Text('GO'),
                        onPressed: () async {
                          try {
                            Dialogs.showLoadingDialog(context, _globalKey);
                            var result = await NewConnectionRepository().testConnection(_controller.getConnection()).whenComplete(() {
                              print(result.toString());
                              Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                            });
                            var dataBaseInfo = result.toTable();
                            var databaseInfoId = await Database.instance.databaseInfoDao.add(dataBaseInfo);
                            await Database.instance.connectionDao.add(_controller.getConnection().copyWith(databaseInfoId: databaseInfoId, schema: result.currentSchema));
                            Navigator.of(context).pop();
                          } catch(e) {
                            Dialogs.errorDialog(e, true, context);
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
