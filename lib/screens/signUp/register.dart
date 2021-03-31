import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/palette.dart';
import '../../providers/authProvider.dart';
import '../../widgets/customText.dart';
import '../../screens/home/home.dart';
import '../background.dart';
import 'widgets/formWidget.dart';

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
            body: SingleChildScrollView(
              child: Background(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: CustomText(
                        text: "REGISTER",
                        weight: FontWeight.bold,
                        color: Palette.primary,
                        size: 36,
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
