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

  @override
  Widget build(BuildContext context) {
    final NewConnectionStore _controller = Provider.of<NewConnectionStore>(context);
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final RouteArguments args = ModalRoute.of(context).settings.arguments;

    if(args != null) {
      _controller.loadData(args.id);
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
                          initialValue: _controller.name,
                          onChanged: _controller.setName,

                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Observer(
                      builder: (_) => ContainerFormItem(
                        child: DropdownButton(
                            hint: Text('Vendor'),
                            isExpanded: true,
                            value: _controller.vendor,
                            items: databaseImages.keys.map((String value) {
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
                        decoration: TextFieldFormItemDecoraction('Hostname', IconsForMyApp.link_outline),
                        initialValue: _controller.host,
                        onChanged: _controller.setHost,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Port', IconsForMyApp.export_outline),
                        initialValue: _controller.port,
                        onChanged: _controller.setPort,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Database', IconsForMyApp.database),
                        initialValue: _controller.databaseName,
                        onChanged: _controller.setDatabaseName,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('User', IconsForMyApp.user),
                        initialValue: _controller.user,
                        onChanged: _controller.setUser,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ContainerFormItem(
                      child: TextFormField(
                        decoration: TextFieldFormItemDecoraction('Password', IconsForMyApp.key),
                        initialValue: _controller.password,
                        onChanged: _controller.setPassword,
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
                          await NewConnectionRepository().connectDB(_controller.getConnection()).whenComplete(() {
                            Future.delayed(Duration(seconds: 1));
                            Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                          });
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Test Connection Succesfull!', style: TextStyle(color: Colors.white),),
                            ),
                          );
                        } catch(e) {
                          print(e.toString());
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
                          DatabaseInfoModel result = await NewConnectionRepository().connectDB(_controller.getConnection()).whenComplete(() {
                            Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                          });
                          var dataBaseInfo = result.toTable();
                          var databaseInfoId = await Database.instance.databaseInfoDao.add(dataBaseInfo);
                          await Database.instance.connectionDao.add(_controller.getConnection().copyWith(databaseInfoId: databaseInfoId, schema: result.currentSchema));
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


