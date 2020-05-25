import 'package:dbclientapp/config/icons_for_my_app_icons.dart';
import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/model/route_arguments.dart';
import 'package:dbclientapp/network/request.dart';
import 'package:dbclientapp/pages/connection_home/connection_home_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_constants.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_page.dart';
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
            if(!snapshot.hasData || snapshot.data.length == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No databases connection found', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black87.withOpacity(.7)), textAlign: TextAlign.center,),
                    Container(
                      width: 280.0,
                      height: 280.0,
                      margin: EdgeInsets.symmetric(vertical: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                      child: Center(child: Image.asset('assets/images/no-database.png', width: 160.0,)),
                    ),
                    Text('Tap on plus button to add a database to begin use the app and manager your database', textAlign: TextAlign.center,),
                  ],
                ),
              );
            }

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
