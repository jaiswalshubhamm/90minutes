import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/authProvider.dart';

class FormWidgetLogin extends StatefulWidget {
  @override
  _FormWidgetLoginState createState() => _FormWidgetLoginState();
}

class _FormWidgetLoginState extends State<FormWidgetLogin> {
  Map<String, String> _formData = {
    'email': '',
    'password': '',
  };
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [
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
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
          ),
          // SizedBox(height: 10),
          SizedBox(height: size.height * 0.05),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState.validate()) {
                  return;
                }
                _formKey.currentState.save();
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Authenticating User..')));
                  await Provider.of<AuthProvider>(
                    context,
                    listen: false,
                  ).login(
                    _formData['email'],
                    _formData['password'],
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
                      Color.fromRGBO(17, 168, 23, 1),
                      Color.fromRGBO(17, 168, 23, 0.4)
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
