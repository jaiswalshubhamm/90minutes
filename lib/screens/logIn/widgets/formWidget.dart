import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/authProvider.dart';
import 'emailField.dart';
import 'passwordField.dart';

class FormWidgetLogin extends StatefulWidget {
  @override
  _FormWidgetLoginState createState() => _FormWidgetLoginState();
}

class _FormWidgetLoginState extends State<FormWidgetLogin> {
  Map<String, String> _formData = {
    'email': '',
    'password': '',
  };
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: AutofillGroup(
          child: Column(
            children: [
              EmailFieldWidget(controller: emailController),
              SizedBox(height: size.height * 0.03),
              PasswordFieldWidget(controller: passwordController),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    _formData['email'] = emailController.text;
                    _formData['password'] = passwordController.text;
                    if (!formKey.currentState.validate()) {
                      return;
                    }
                    formKey.currentState.save();
                    if (formKey.currentState.validate()) {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
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
        ),
      ),
    );
  }
}
