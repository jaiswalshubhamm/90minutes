import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/palette.dart';
import '../../providers/authProvider.dart';
import '../../widgets/customText.dart';
import '../home/home.dart';
import '../background.dart';
import 'widgets/formWidget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var authData = Provider.of<AuthProvider>(context);
    return (authData.isLoggedIn)
        ? Home()
        : Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Background(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: CustomText(
                            text: "LOGIN",
                            weight: FontWeight.bold,
                            color: Palette.primary,
                            size: 36,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        FormWidgetLogin(),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.of(context).pushNamed('/register'),
                            },
                            child: CustomText(
                              text: "Don't Have an Account? Sign up",
                              size: 12,
                              weight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
