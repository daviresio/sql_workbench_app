import 'package:dbclientapp/config/icons_for_my_app_icons.dart';
import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/model/route_arguments.dart';
import 'package:dbclientapp/network/request.dart';
import 'package:dbclientapp/pages/connection_home/connection_home_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_constants.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_repository.dart';
import 'package:dbclientapp/util/string_util.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/dialogs.dart';

class ConnectionsPage extends StatefulWidget {

  static const String routeName = '/';

  @override
  _ConnectionsPageState createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage> {

  GlobalKey<State> _globalKey = GlobalKey<State>();
  final _connectionsDao = Database.instance.connectionDao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(NewConnectionPage.routeName);
        },
      ),
      body: Container(
        child: StreamBuilder(
          stream: _connectionsDao.list(),
          initialData: [],
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Connection item = snapshot.data[index];
                  return GestureDetector(
                    onTap: () async {
                      try {
                        DatabaseInfoModel result = await Request().connectDB(item, context);
                        var dataBaseInfo = result.toTable();
                        await Database.instance.databaseInfoDao.edit(dataBaseInfo.copyWith(id: item.databaseInfoId));
                        Navigator.pushNamed(context, ConnectionHome.routeName, arguments: RouteArguments(id: item.id));
                      } catch(e) {}
                    },
                    child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset('assets/images/${databaseImages[item.vendor]}', width: 100.0,),
                            SizedBox(width: 12.0,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black54),),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    children: <Widget>[
                                      Icon(IconsForMyApp.link_outline, size: 15.0,),
                                      SizedBox(width: 8.0,),
                                      Expanded(child: Text(item.host, overflow: TextOverflow.fade, softWrap: false, maxLines: 1,)),
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    children: <Widget>[
                                      Icon(IconsForMyApp.database, size: 15.0,),
                                      SizedBox(width: 8.0,),
                                      Text(item.databaseName),
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    children: <Widget>[
                                      Icon(IconsForMyApp.user, size: 15.0,),
                                      SizedBox(width: 8.0,),
                                      Text(item.user),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton(
                          onSelected: (value) async {
                            switch(value) {
                              case 'EDIT':
                                print(item.toString());
                                Navigator.pushNamed(context, NewConnectionPage.routeName, arguments: RouteArguments(id: item.id));
                                break;
                              case 'COPY':
                                DatabaseInfo databaseInfoAtual = await Database.instance.databaseInfoDao.find(item.databaseInfoId);
                                var newDatabaseInfoData = DatabaseInfo(databases: databaseInfoAtual.databases, tables: databaseInfoAtual.tables, functions: databaseInfoAtual.functions,
                                schemas: databaseInfoAtual.schemas, storeProcedures: databaseInfoAtual.storeProcedures, views: databaseInfoAtual.views);
                                int newDatabaseInfoId = await Database.instance.databaseInfoDao.add(newDatabaseInfoData);

                                var newConnectionData = Connection(host: item.host, name: StringUtil.copyAddingNumber(item.name), vendor: item.vendor, ssh: item.ssh, port: item.port, password: item.password, user: item.user,
                                databaseName: item.databaseName, schema: item.schema, databaseInfoId: newDatabaseInfoId);
                                await Database.instance.connectionDao.add(newConnectionData);
                                break;
                              case 'DELETE':
                                bool deleteRecord = await Dialogs.deleteDialog(context);
                                if(deleteRecord == true) {
                                  await Database.instance.databaseInfoDao.remove(item.databaseInfoId);
                                  await Database.instance.connectionDao.remove(item.id);
                                }

                            }
                          },
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: 'EDIT',
                                child: Text('Edit'),
                              ),
                              PopupMenuItem(
                                value: 'COPY',
                                child: Text('Copy'),
                              ),
                              PopupMenuItem(
                                value: 'DELETE',
                                child: Text('Delete'),
                              ),
                            ];
                          },
                        ),
                      ),
                    ),
                  );
                },
            );
          },
        ),
      ),
    );
  }
}
