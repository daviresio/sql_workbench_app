import 'package:dbclientapp/pages/login/pages/view_pager/auth_sms_step_one.dart';
import 'package:dbclientapp/pages/login/pages/view_pager/auth_sms_step_two.dart';
import 'package:flutter/material.dart';

class AuthSmsPage extends StatefulWidget {

  static const String routeName = '/auth-sms';

  @override
  _AuthSmsPageState createState() => _AuthSmsPageState();
}

class _AuthSmsPageState extends State<AuthSmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          AuthSmsStepOne(),
          AuthSmsStepTwo(),
        ],
      ),
    );
  }
}
