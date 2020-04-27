import 'package:dbclientapp/config/icons_for_my_app_icons.dart';
import 'package:dbclientapp/model/route_arguments.dart';
import 'package:dbclientapp/pages/connection_home/pages/favorite/favorite_page.dart';
import 'package:dbclientapp/pages/connection_home/pages/history/history_page.dart';
import 'package:dbclientapp/pages/connection_home/pages/info_database/info_database_page.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import './connection_home_store.dart';

class ConnectionHome extends StatefulWidget {

  static const String routeName = '/connection-home';

  @override
  _ConnectionHomeState createState() => _ConnectionHomeState();
}

class _ConnectionHomeState extends State<ConnectionHome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    final _tabController = TabController(
      length: 4,
      initialIndex: 0,
      vsync: this,
    );

    final RouteArguments args = ModalRoute.of(context).settings.arguments;
    if(args == null) return Container();

    ConnectionHomeStore _controller = Provider.of<ConnectionHomeStore>(context);
    _controller.setConnectionsWithInfo(args.id);

    return Observer(
        builder: (_) {
          if (_controller.connectionsWithInfo == null) return Container();

          return Scaffold(
            appBar: AppBar(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_controller.connectionsWithInfo.connection
                      .databaseName),
                  Text('${_controller.connectionsWithInfo.connection
                      .databaseName} - ${_controller.connectionsWithInfo
                      .connection.schema}')
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
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                InfoDatabasePage(databaseInfoId: _controller.connectionsWithInfo.databaseInfo.id, connectionId: _controller.connectionsWithInfo.connection.id),
                QueryPage(databaseInfoId: _controller.connectionsWithInfo.databaseInfo.id, connectionId: _controller.connectionsWithInfo.connection.id),
                FavoritePage(databaseInfoId: _controller.connectionsWithInfo.databaseInfo.id, connectionId: _controller.connectionsWithInfo.connection.id),
                HistoryPage(databaseInfoId: _controller.connectionsWithInfo.databaseInfo.id, connectionId: _controller.connectionsWithInfo.connection.id),
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
  const ChoiceTab(title: 'INFO', icon: IconsForMyApp.table),
  const ChoiceTab(title: 'QUERY', icon: IconsForMyApp.database),
  const ChoiceTab(title: 'FAVORITE', icon: IconsForMyApp.star),
  const ChoiceTab(title: 'HISTORY', icon: IconsForMyApp.history),
];
