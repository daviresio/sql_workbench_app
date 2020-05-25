import 'package:dbclientapp/pages/auth/login_page.dart';
import 'package:dbclientapp/pages/auth/service/base_auth.dart';
import 'package:dbclientapp/pages/connections/connections_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InitialScreenPage extends StatefulWidget {

  static const String routeName = '/initial-screen';

  @override
  _InitialScreenPageState createState() => _InitialScreenPageState();
}

class _InitialScreenPageState extends State<InitialScreenPage> {

  Future defineDirecton() async {
    BaseAuth auth = Auth();
    bool isLogged = await auth.isLoged();

    if(isLogged) {
      Navigator.of(context).pushReplacementNamed(ConnectionsPage.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    defineDirecton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}
