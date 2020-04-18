import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/database/model/ConnectionWithInfo.dart';
import 'package:dbclientapp/pages/connection_home/widgets/expanded_item.dart';
import 'package:dbclientapp/util/converter_util.dart';
import 'package:flutter/material.dart';

class InfoDatabasePage extends StatefulWidget {
  @override
  _InfoDatabasePageState createState() => _InfoDatabasePageState();
}

class _InfoDatabasePageState extends State<InfoDatabasePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectionsWithInfo>(
        stream: Database.instance.connectionDao.findConnectionWithInfo(1),
        builder: (context, snapshot) {

          if(!snapshot.hasData) return Container();

          List<String> databases = ConverterUtil.stringToList(snapshot.data.databaseInfo.databases);
          List<String> schemas = ConverterUtil.stringToList(snapshot.data.databaseInfo.schemas);
          List<String> tables = ConverterUtil.stringToList(snapshot.data.databaseInfo.tables);
          List<String> views = ConverterUtil.stringToList(snapshot.data.databaseInfo.views);
          List<String> storeProcedures = ConverterUtil.stringToList(snapshot.data.databaseInfo.storeProcedures);
          List<String> functions = ConverterUtil.stringToList(snapshot.data.databaseInfo.functions);

          return Scaffold(
            body: Container(
              child: ListView(
                children: <Widget>[
                  ExpandedItem(
                    title: 'Databases',
                    image: 'assets/images/databases.png',
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: databases.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            'assets/images/databases.png', height: 30.0,),
                          title: Text(databases[index]),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text('Edit'),
                                  value: 'EDIT',
                                ),
                                PopupMenuItem(
                                  child: Text('Copy'),
                                  value: 'COPY',
                                ),
                                PopupMenuItem(
                                  child: Text('Delete'),
                                  value: 'DELETE',
                                ),
                              ];
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  ExpansionTile(
                    title: Text('Schemas'),
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: schemas.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(schemas[index]),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}