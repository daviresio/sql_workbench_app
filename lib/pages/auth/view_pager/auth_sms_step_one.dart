import 'package:dbclientapp/pages/auth/controller/auth_store.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthSmsStepOne extends StatefulWidget {

  final Function sendSms;

  const AuthSmsStepOne({Key key, this.sendSms}) : super(key: key);

  @override
  _AuthSmsStepOneState createState() => _AuthSmsStepOneState();
}

class _AuthSmsStepOneState extends State<AuthSmsStepOne> {
  String verificationId;

  AuthStore _controller = AuthStore();

  getLocations() async {
    String locale = await Devicelocale.currentLocale;
    _controller.setCountryGeolocation(locale);
  }

  @override
  void initState() {
    super.initState();
    getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                child: Center(child: Image.asset('assets/images/smartphone.png', width: 160.0,)),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Registration',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Enter your phone number to verify your account',
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
                      Observer(
                        builder: (_) {
                          if(_controller.countryGeolocation == null) return Container();

                          return InternationalPhoneNumberInput(
                            initialValue: PhoneNumber(isoCode: _controller.countryGeolocation),
                            inputBorder: OutlineInputBorder(),
                            onInputChanged: (PhoneNumber phoneNumber) {
                              _controller.setPhoneNumber(phoneNumber.phoneNumber);
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          onPressed: () async {
                            String value = _controller.phoneNumber;
                            if(value == null || value.length == 0) {
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Phone is reequired!'),));
                              return;
                            }
                            widget.sendSms(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
