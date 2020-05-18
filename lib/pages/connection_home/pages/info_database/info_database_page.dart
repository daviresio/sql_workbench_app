import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/pages/connection_home/widgets/expanded_item.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_repository.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import './info_database_store.dart';

class InfoDatabasePage extends StatefulWidget {

  final int databaseInfoId;
  final int connectionId;
  final Function useQuerySaved;

  const InfoDatabasePage({Key key, this.databaseInfoId, this.connectionId, this.useQuerySaved}) : super(key: key);

  @override
  _InfoDatabasePageState createState() => _InfoDatabasePageState();
}

class _InfoDatabasePageState extends State<InfoDatabasePage> {

  final GlobalKey<State> _globalKey = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {

    InfoDatabaseStore _controller = Provider.of<InfoDatabaseStore>(context);
    _controller.initData(widget.connectionId);

          return Scaffold(
            body: ListView(
              children: <Widget>[
                SizedBox(height: 20.0,),
                Observer(
                  builder: (_) => ExpandedItem(
                    title: 'Databases',
                    image: 'assets/images/database.png',
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.databases.length,
                      itemBuilder: (context, index) {
                        bool isSelected = _controller.connection.databaseName == _controller.databases[index];
                        return Container(
                          color: (isSelected ? Colors.blueAccent : Colors.transparent),
                          child: ListTile(
                            leading: Image.asset('assets/images/database.png', height: 30.0,),
                            title: Text(_controller.databases[index], style: TextStyle(color: (isSelected ? Colors.white : Colors.black87)),),
                            trailing: PopupMenuButton(
                              onSelected: (value) async {
                                switch(value) {
                                  case 'MAKE_DEFAULT':
                                try {
                                  Dialogs.showLoadingDialog(context, _globalKey);
                                  DatabaseInfoModel result = await NewConnectionRepository().connectDB(_controller.connection.copyWith(databaseName: _controller.databases[index])).whenComplete(() {
                                    Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                                  });
                                  var dataBaseInfo = result.toTable();
                                    await Database.instance.connectionDao.edit(_controller.connection.copyWith(schema: result.currentSchema, databaseName: _controller.databases[index]));
                                    await Database.instance.databaseInfoDao.edit(dataBaseInfo.copyWith(id: _controller.connection.databaseInfoId));
                                } catch(e) {
                                  Dialogs.errorDialog(e, context);
                                }
                                break;
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: Text('Make default'),
                                    value: 'MAKE_DEFAULT',
                                  ),
                                  PopupMenuItem(
                                    child: Text('Drop'),
                                    value: 'DROP',
                                  ),
                                ];
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Observer(
                  builder: (_) => ExpandedItem(
                    title: 'Schemas',
                    image: 'assets/images/schema.png',
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.schemas.length,
                      itemBuilder: (context, index) {
                        bool isSelected = _controller.connection.schema == _controller.schemas[index];
                        return Container(
                          color: (isSelected ? Colors.blueAccent : Colors.transparent),
                          child: ListTile(
                            leading: Image.asset('assets/images/schema.png', height: 30.0,),
                            title: Text(_controller.schemas[index], style: TextStyle(color: (isSelected ? Colors.white : Colors.black87)),),
//TODO entender melhor como funciona os schemas do banco de dados e ver a melhor forma de trabalhar isso
//                            trailing: PopupMenuButton(
//                              itemBuilder: (context) {
//                                return [
//                                  PopupMenuItem(
//                                    child: Text('Make default'),
//                                    value: 'MAKE_DEFAULT',
//                                  ),
//                                  PopupMenuItem(
//                                    child: Text('Drop'),
//                                    value: 'DROP',
//                                  ),
//                                ];
//                              },
//                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Observer(
                  builder: (_) => ExpandedItem(
                    title: 'Tables',
                    image: 'assets/images/table.png',
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.tables.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            widget.useQuerySaved('SELECT * FROM \"${_controller.tables[index]}\" LIMIT 1000;');
                          },
                          leading: Image.asset('assets/images/table.png', height: 30.0,),
                          title: Text(_controller.tables[index], style: TextStyle(color: Colors.black87),),
                          trailing: PopupMenuButton(
                            onSelected: (value) async {
                              switch (value) {
                                case 'NEW_ROW':

                                  break;
                                case 'DROP':

                                  break;
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text('New row'),
                                  value: 'NEW_ROW',
                                ),
                                PopupMenuItem(
                                  child: Text('Drop'),
                                  value: 'DROP',
                                ),
                              ];
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Observer(
                  builder: (_) => ExpandedItem(
                    title: 'Views',
                    image: 'assets/images/view.png',
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.views.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            widget.useQuerySaved('SELECT * FROM \"${_controller.views[index]}\" LIMIT 1000;');
                          },
                          leading: Image.asset('assets/images/view.png', height: 30.0,),
                          title: Text(_controller.views[index], style: TextStyle(color: Colors.black87),),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text('Drop'),
                                  value: 'DROP',
                                ),
                              ];
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Observer(
                  builder: (_) => ExpandedItem(
                    title: 'Stored Procedures',
                    image: 'assets/images/store_producer.png',
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.storeProcedures.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset('assets/images/store_producer.png', height: 30.0,),
                          title: Text(_controller.storeProcedures[index], style: TextStyle(color: Colors.black87),),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text('Drop'),
                                  value: 'DROP',
                                ),
                              ];
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Observer(
                  builder: (_) => ExpandedItem(
                    title: 'Functions',
                    image: 'assets/images/function.png',
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.functions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset('assets/images/function.png', height: 30.0,),
                          title: Text(_controller.functions[index], style: TextStyle(color: Colors.black87),),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text('Drop'),
                                  value: 'DROP',
                                ),
                              ];
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            ),
          );
  }
}