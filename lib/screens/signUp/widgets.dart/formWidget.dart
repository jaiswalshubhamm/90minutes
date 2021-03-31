import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/authProvider.dart';

class FormWidgetSignup extends StatefulWidget {
  @override
  _FormWidgetSignupState createState() => _FormWidgetSignupState();
}

class _FormWidgetSignupState extends State<FormWidgetSignup> {
  Map<String, String> _formData = {
    'email': '',
    'name': '',
    'password': '',
    'c_password': ''
  };
  // var _error = "";
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey2,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _formData['name'] = value;
              },
              decoration: InputDecoration(labelText: "Name"),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty || !value.contains('@')) {
                  return 'Please enter valid email';
                }
                return null;
              },
              onSaved: (value) {
                _formData['email'] = value;
              },
              decoration: InputDecoration(labelText: "Email"),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty || value.length < 5) {
                  return 'Password is too short!';
                }
                return null;
              },
              onSaved: (value) {
                _formData['password'] = value;
              },
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty || value.length < 5) {
                  return 'Password is too short!';
                }
                return null;
              },
              onSaved: (value) {
                _formData['c_password'] = value;
              },
              decoration: InputDecoration(
                labelText: "Confirm Password",
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: size.height * 0.05),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            child: ElevatedButton(
              onPressed: () async {
                if (!_formKey2.currentState.validate()) {
                  return;
                }
                _formKey2.currentState.save();
                if (_formData['password'] != _formData['c_password']) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Password and Confirm Password must be same..',
                      ),
                    ),
                  );
                  return;
                }
                if (_formKey2.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Authenticating User...',
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  await Provider.of<AuthProvider>(
                    context,
                    listen: false,
                  ).register(
                    _formData['name'],
                    _formData['email'],
                    _formData['password'],
                    _formData['c_password'],
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(
                    80.0,
                  ),
                ),
                padding: const EdgeInsets.all(0),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                width: size.width * 0.5,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: new LinearGradient(
                    colors: [
                      Palette.primary,
                      Color.fromRGBO(17, 168, 23, 1),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "REGISTER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
