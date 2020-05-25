import 'package:dbclientapp/pages/auth/auth_sms_page.dart';
import 'package:dbclientapp/pages/connections/connections_page.dart';
import 'package:dbclientapp/pages/initial_screen/initial_screen_page.dart';
import 'package:flutter/material.dart';

import 'service/base_auth.dart';

class LoginPage extends StatefulWidget {

  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 220.0,
                  height: 220.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        color: Colors.grey[200],
                      )
                    ],
                  ),
                  child: Center(child: Image.asset('assets/images/get_started.png', width: 160.0,)),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Let\'s get started',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Never a better time than now to start managing all your postgresql databases with ease',
                      style: TextStyle(color: Colors.black54, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('Create Account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        color: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AuthSmsPage.routeName);
                        },
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('Enter without login', style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onPressed: () async {
                          await Auth().anonimousSignIn();
                          Navigator.of(context).pushReplacementNamed(ConnectionsPage.routeName);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
