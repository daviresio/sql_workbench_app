import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/database/model/ConnectionWithInfo.dart';
import 'package:dbclientapp/model/route_arguments.dart';
import 'package:dbclientapp/pages/connection_home/pages/favorite/favorite_page.dart';
import 'package:dbclientapp/pages/connection_home/pages/history/history_page.dart';
import 'package:dbclientapp/pages/connection_home/pages/info_database/info_database_page.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConnectionHome extends StatefulWidget {

  static const String routeName = '/connection-home';

  @override
  _ConnectionHomeState createState() => _ConnectionHomeState();
}

class _ConnectionHomeState extends State<ConnectionHome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    final RouteArguments args = ModalRoute.of(context).settings.arguments;

    final _tabController = TabController(
      length: 4,
      initialIndex: 0,
      vsync: this,
    );

    if(args == null) return Container();

    Database.instance.connectionDao.findConnectionWithInfo(1).listen((onValue) {
      print(onValue.toString());
    }).onError((onError) {
      print(onError.toString());
      throw onError;
    });

    return StreamBuilder<ConnectionsWithInfo>(
        stream: Database.instance.connectionDao.findConnectionWithInfo(1),
        builder: (context, snapshot) {

          if(!snapshot.hasData) return Container();

          print(snapshot.data.toString());

          return Scaffold(
            appBar: AppBar(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot.data.connection.databaseName),
                  Text('${snapshot.data.connection.databaseName} - ${snapshot.data.connection.schema}')
                ],
              ),
                bottom: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs: choicesTabs.map((ChoiceTab choiceTab) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Tab(
                        icon: Icon(choiceTab.icon),
                      ),
                    );
                  }).toList(),
                ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                InfoDatabasePage(),
                QueryPage(),
                FavoritePage(),
                HistoryPage(),
              ],
            ),
          );
        }
    );
  }
}

class ChoiceTab {
  final String title;
  final IconData icon;

  const ChoiceTab({this.title, this.icon});

}


const List<ChoiceTab> choicesTabs = const <ChoiceTab> [
  const ChoiceTab(title: 'INFO', icon: FontAwesomeIcons.table),
  const ChoiceTab(title: 'QUERY', icon: FontAwesomeIcons.database),
  const ChoiceTab(title: 'FAVORITE', icon: FontAwesomeIcons.star),
  const ChoiceTab(title: 'HISTORY', icon: FontAwesomeIcons.clock),
];
