import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/screens/signUp/widgets/confirmPasswordField.dart';
import 'package:provider/provider.dart';
import '../../../widgets/customText.dart';
import '../../../config/palette.dart';
import '../../../providers/authProvider.dart';
import 'nameField.dart';
import 'emailField.dart';
import 'passwordField.dart';

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
  final formKey2 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: formKey2,
      child: SingleChildScrollView(
        child: AutofillGroup(
          child: Column(
            children: [
              NameFieldWidget(controller: nameController),
              SizedBox(height: size.height * 0.03),
              EmailFieldWidget(controller: emailController),
              SizedBox(height: size.height * 0.03),
              PasswordFieldWidget(controller: passwordController),
              SizedBox(height: size.height * 0.03),
              ConfirmPasswordFieldWidget(controller: confirmPasswordController),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    if (!formKey2.currentState.validate()) {
                      return;
                    }
                    formKey2.currentState.save();
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
                    if (formKey2.currentState.validate()) {
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
                    child: CustomText(
                      text: "REGISTER",
                      color: Palette.white,
                      bgColor: Palette.transparent,
                      weight: FontWeight.bold,
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
