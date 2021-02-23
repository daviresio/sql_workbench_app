import 'package:dbclientapp/pages/connections/connections_page.dart';
import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'service/base_auth.dart';
import 'view_pager/auth_sms_step_one.dart';
import 'view_pager/auth_sms_step_two.dart';

class AuthSmsPage extends StatefulWidget {
  static const String routeName = '/auth-sms';

  @override
  _AuthSmsPageState createState() => _AuthSmsPageState();
}

class _AuthSmsPageState extends State<AuthSmsPage> {
  PageController _pageController = PageController();
  String verificationId;

  backToPageOne() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }


  sendSms(String phoneNumber) async {
    void getVerificationId(String verificationId) {
      this.verificationId = verificationId;
      _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    void getErrorToThrow(String errorMessage) {
      Dialogs.errorDialog(errorMessage, context);
    }

    await Auth().sendCodeToPhoneNumber(phoneNumber, getVerificationId, getErrorToThrow);
  }

  void signin(String smsCode) async {
    try {
      AuthCredential authcredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      await FirebaseAuth.instance.signInWithCredential(authcredential);
      Navigator.pushReplacementNamed(context, ConnectionsPage.routeName);
    } catch (e) {
      print(e.runtimeType);
      print(e);
      if(e is PlatformException) {
        Dialogs.errorDialog(e.message, context);
        return;
      }
      Dialogs.errorDialog('An error happends, verify your phone number and sms code and try again!', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          AuthSmsStepOne(sendSms: sendSms),
          AuthSmsStepTwo(signin: signin, backToPageOne: backToPageOne),
        ],
      ),
    );
  }
}
