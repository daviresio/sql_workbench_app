import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/model/route_arguments.dart';
import 'package:dbclientapp/pages/connection_home/connection_home_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_repository.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/dialogs.dart';

class ConnectionsPage extends StatefulWidget {
  @override
  _ConnectionsPageState createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage> {

  final GlobalKey<State> _globalKey = GlobalKey<State>();
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
                        Dialogs.showLoadingDialog(context, _globalKey);
                        DatabaseInfoModel result = await NewConnectionRepository().connectDB(item).whenComplete(() {
                          Navigator.of(_globalKey.currentContext, rootNavigator: true).pop();
                        });
                        var dataBaseInfo = result.toTable();
                        await Database.instance.databaseInfoDao.edit(dataBaseInfo.copyWith(id: item.databaseInfoId));
                        Navigator.pushNamed(context, ConnectionHome.routeName, arguments: RouteArguments(id: item.id));
                      } catch(e) {
                        Dialogs.errorDialog(e, true, context);
                      }
                    },
                    child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(item.name, style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
                              children: <Widget>[
                                Icon(Icons.view_day),
                                Flexible(child: Text(item.host)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.view_day),
                                Text(item.databaseName),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.view_day),
                                Text(item.user),
                              ],
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton(
                          onSelected: (value) {},
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              PopupMenuItem(
                                value: 'copy',
                                child: Text('Copy'),
                              ),
                              PopupMenuItem(
                                value: 'delete',
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
