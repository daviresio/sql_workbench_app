import 'package:dbclientapp/pages/auth/controller/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthSmsStepTwo extends StatefulWidget {

  final Function signin;
  final Function backToPageOne;

  const AuthSmsStepTwo({Key key, this.signin, this.backToPageOne}) : super(key: key);

  @override
  _AuthSmsStepTwoState createState() => _AuthSmsStepTwoState();
}

class _AuthSmsStepTwoState extends State<AuthSmsStepTwo> {

  AuthStore _controller = AuthStore();
  FocusNode focusNode = FocusNode();


  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    FocusScope.of(context).requestFocus(focusNode);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    widget.backToPageOne();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
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
                child: Center(child: Image.asset('assets/images/phone_sms.png', width: 160.0,)),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Registration',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'Enter your sms code to verify your account',
                    style: TextStyle(color: Colors.black54, fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Card(
                elevation: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      PinCodeTextField(
                        length: 6,
                        textInputType: TextInputType.number,
                        autoFocus: true,
                        focusNode: focusNode,
                        pinTheme: PinTheme(
                          activeColor: Colors.deepPurpleAccent,
                          selectedColor: Colors.deepPurpleAccent,
                          inactiveColor: Colors.grey[200],
                        ),
                        onChanged: (String value) {
                          _controller.setSmsCode(value);
                          if(value.length == 6) widget.signin(value);
                        },
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: double.infinity,
                        child: Observer(
                          builder: (_) => RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text('Continue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            color: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            onPressed: _controller.smsCode.length < 6 ? null : () {
                                widget.signin(_controller.smsCode);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
