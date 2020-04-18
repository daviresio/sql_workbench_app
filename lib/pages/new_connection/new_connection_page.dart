import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_repository.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_store.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewConnectionPage extends StatefulWidget {

  static const String routeName = '/new-connection';

  @override
  _NewConnectionPageState createState() => _NewConnectionPageState();
}

class _NewConnectionPageState extends State<NewConnectionPage> {

  final GlobalKey<State> _globalKey = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    final NewConnectionStore _controller = Provider.of<NewConnectionStore>(context);
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('New Connecion'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
          child: ListView(
              children: <Widget>[
                SizedBox(height: 30.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Name'),
                        initialValue: _controller.name,
                        onChanged: _controller.setName,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Observer(
                      builder: (_) => ContainerFormItem(
                        child: DropdownButton(
                            hint: Text('Vendor'),
                            isExpanded: true,
                            value: _controller.vendor,
                            items: <String>['Postgresql'].map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(), onChanged: _controller.setVendor),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Hostname'),
                        initialValue: _controller.host,
                        onChanged: _controller.setHost,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Port'),
                        initialValue: _controller.port,
                        onChanged: _controller.setPort,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Database'),
                        initialValue: _controller.databaseName,
                        onChanged: _controller.setDatabaseName,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('User'),
                        initialValue: _controller.user,
                        onChanged: _controller.setUser,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Password'),
                        initialValue: _controller.password,
                        onChanged: _controller.setPassword,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('SSH', style: TextStyle(color: Colors.blueAccent),),
                          Switch(
                            value: _controller.ssh,
                            onChanged: _controller.setSsh,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('CANCEL', style: TextStyle(color: Colors.redAccent),),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 10.0,),
                    FlatButton(
                      child: Text('TEST', style: TextStyle(color: Colors.green),),
                      onPressed: () async {
                        try {
                          Dialogs.showLoadingDialog(context, _globalKey);
                          await NewConnectionRepository().testConnection(_controller.getConnection()).whenComplete(() {
                            Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                          });
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Connection Succesfull!', style: TextStyle(color: Colors.white),),
                            ),
                          );
                        } catch(e) {
                          errorDialog(e, true, context);
                        }

                      },
                    ),
                    SizedBox(width: 10.0,),
                    FlatButton(
                      child: Text('SAVE', style: TextStyle(color: Colors.blueAccent),),
                      onPressed: () async {
                        try {
                          Dialogs.showLoadingDialog(context, _globalKey);
                          DatabaseInfoModel result = await NewConnectionRepository().testConnection(_controller.getConnection()).whenComplete(() {
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
                ),
              ]
          ),
        )
    );
  }
}

InputDecoration TextFieldFormItemDecoraction(String label) {
  return InputDecoration(
    labelText: label,
//    prefixIcon: Icon(Icons.text_format),
    border: OutlineInputBorder(),
  );
}

Widget ContainerFormItem({Widget child}) {
  return Container(
      padding: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
            )
          ]
      ),
      child: child
  );
}


