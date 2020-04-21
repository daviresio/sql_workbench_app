import 'package:dbclientapp/pages/connection_home/connection_home_page.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_store.dart';
import 'package:dbclientapp/pages/connections/connections_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NewConnectionStore>(
          create: (_) => NewConnectionStore(),
        ),
        Provider<QueryStore>(
          create: (_) => QueryStore(),
        ),
      ],
      child: MainApp(),
    );
  }
}


class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sql Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ConnectionsPage(),
        NewConnectionPage.routeName: (context) =>  NewConnectionPage(),
        ConnectionHome.routeName: (context) =>  ConnectionHome(),
      },
    );
  }
}

