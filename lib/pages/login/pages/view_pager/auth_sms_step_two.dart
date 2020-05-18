import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthSmsStepTwo extends StatefulWidget {
  @override
  _AuthSmsStepTwoState createState() => _AuthSmsStepTwoState();
}

class _AuthSmsStepTwoState extends State<AuthSmsStepTwo> {
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
              //TODO colocar a imagem aqui no lugar
              Container(
                width: 220.0,
                height: 220.0,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(200.0)
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Registration',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'Enter your phone number to verify your account',
                    style: TextStyle(color: Colors.black54, fontSize: 16.0),
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
                        length: 4,
                        pinTheme: PinTheme(
                          activeColor: Colors.deepPurpleAccent,
                          selectedColor: Colors.deepPurpleAccent,
                          inactiveColor: Colors.grey[200],
                        ),
                        onChanged: (String value) {

                        },
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Continue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          color: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          onPressed: () {
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
