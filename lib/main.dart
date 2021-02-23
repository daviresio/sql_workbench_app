import 'package:dbclientapp/pages/connection_home/connection_home_page.dart';
import 'package:dbclientapp/pages/connection_home/pages/query/query_store.dart';
import 'package:dbclientapp/pages/connections/connections_page.dart';
import 'package:dbclientapp/pages/initial_screen/initial_screen_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_page.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/auth/auth_sms_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/connection_home/pages/info_database/info_database_store.dart';
import 'pages/connection_home/pages/history/history_store.dart';
import 'pages/connection_home/pages/favorite/favorite_store.dart';
import 'pages/connection_home/connection_home_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  
  runApp(MyApp());
}

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
        Provider<InfoDatabaseStore>(
          create: (_) => InfoDatabaseStore(),
        ),
        Provider<HistoryStore>(
          create: (_) => HistoryStore(),
        ),
        Provider<FavoriteStore>(
          create: (_) => FavoriteStore(),
        ),
        Provider<ConnectionHomeStore>(
          create: (_) => ConnectionHomeStore(),
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
      debugShowCheckedModeBanner: false,
      title: 'Postgres Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromRGBO(249, 249, 249, 1),
          fontFamily: 'Balsamiq Sans'
      ),
//      initialRoute: '/',
//      initialRoute: LoginPage.routeName,
    initialRoute: InitialScreenPage.routeName,
      routes: {
        ConnectionsPage.routeName: (context) => ConnectionsPage(),
        NewConnectionPage.routeName: (context) =>  NewConnectionPage(),
        ConnectionHome.routeName: (context) =>  ConnectionHome(),
        LoginPage.routeName: (context) =>  LoginPage(),
        AuthSmsPage.routeName: (context) =>  AuthSmsPage(),
        InitialScreenPage.routeName: (context) =>  InitialScreenPage(),
      },
    );
  }
}

