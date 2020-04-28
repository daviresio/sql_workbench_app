import 'package:dbclientapp/config/icons_for_my_app_icons.dart';
import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/model/route_arguments.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_constants.dart';
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

  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _hostNameEditingController = TextEditingController();
  TextEditingController _portEditingController = TextEditingController();
  TextEditingController _databaseEditingController = TextEditingController();
  TextEditingController _userEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NewConnectionStore _controller = Provider.of<NewConnectionStore>(context);
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final RouteArguments args = ModalRoute.of(context).settings.arguments;

    if(args != null) {
      _controller.loadData(args.id).then((Connection onValue) {
        _nameEditingController.text = onValue.name;
        _hostNameEditingController.text = onValue.host;
        _portEditingController.text = onValue.port;
        _databaseEditingController.text = onValue.databaseName;
        _userEditingController.text = onValue.user;
        _passwordEditingController.text = onValue.password;
      });
    }

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
                      child: Observer(
                        builder: (_) => TextFormField(
                          decoration: TextFieldFormItemDecoraction('Name', IconsForMyApp.subtitles),
                          onChanged: _controller.setName,
                          controller: _nameEditingController,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                   ContainerFormItem(
                        child: Observer(
                          builder: (_) => DropdownButton(
                              hint: Text('Vendor'),
                              isExpanded: true,
                              value: _controller.connection.vendor as String,
                              items: () {
                                var items = databaseImages.keys.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                });
                                return List<DropdownMenuItem<String>>.from(items);
                              }(),
                              onChanged: _controller.setVendor
                          ),
                        ),
                   ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Hostname', IconsForMyApp.link_outline),
                        onChanged: _controller.setHost,
                        controller: _hostNameEditingController,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Port', IconsForMyApp.export_outline),
                        onChanged: _controller.setPort,
                        keyboardType: TextInputType.number,
                        controller: _portEditingController,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Database', IconsForMyApp.database),
                        onChanged: _controller.setDatabaseName,
                        controller: _databaseEditingController,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('User', IconsForMyApp.user),
                        onChanged: _controller.setUser,
                        controller: _userEditingController,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Password', IconsForMyApp.key),
                        onChanged: _controller.setPassword,
                        controller: _passwordEditingController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('SSH', style: TextStyle(color: Colors.blueAccent),),
                          Observer(
                            builder: (_) => Switch(
                              value: _controller.connection.ssh,
                              onChanged: _controller.setSsh,
                            ),
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
                          await NewConnectionRepository().connectDB(_controller.connection).whenComplete(() {
                            Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                          });
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Test Connection Succesfull!', style: TextStyle(color: Colors.white),),
                            ),
                          );
                        } catch(e) {
                          Dialogs.errorDialog(e, true, context);
                        }

                      },
                    ),
                    SizedBox(width: 10.0,),
                    FlatButton(
                      child: Text('SAVE', style: TextStyle(color: Colors.blueAccent),),
                      onPressed: () async {
                        try {
                          Dialogs.showLoadingDialog(context, _globalKey);

                          DatabaseInfoModel result = await NewConnectionRepository().connectDB(_controller.connection).whenComplete(() {
                            Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                          });
                          var dataBaseInfo = result.toTable();
                          if(_controller.connection.id == null || _controller.connection.id == 0) {
                          var databaseInfoId = await Database.instance.databaseInfoDao.add(dataBaseInfo);
                          await Database.instance.connectionDao.add(_controller.connection.copyWith(databaseInfoId: databaseInfoId, schema: result.currentSchema));
                          } else {
                            await Database.instance.connectionDao.edit(_controller.connection.copyWith(schema: result.currentSchema));
                            await Database.instance.databaseInfoDao.edit(dataBaseInfo.copyWith(id: _controller.connection.databaseInfoId));
                          }
                          Navigator.of(context).pop();
                        } catch(e) {
                          print(e);
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

InputDecoration TextFieldFormItemDecoraction(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, size: 20.0,),
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


