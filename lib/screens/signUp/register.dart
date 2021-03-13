import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/config/palette.dart';
import 'package:nintyminutesflutter/providers/authProvider.dart';
import 'package:nintyminutesflutter/screens/home/home.dart';
import 'package:provider/provider.dart';

import '../background.dart';
import 'widgets.dart/formWidget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var authData = Provider.of<AuthProvider>(context);
    return (authData.isLoggedIn)
        ? Home()
        : Scaffold(
            body: Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.primary,
                          fontSize: 36,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    FormWidgetSignup(),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            {Navigator.of(context).pushNamed('/login')},
                        child: Text(
                          "Already Have an Account? Sign In",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
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
