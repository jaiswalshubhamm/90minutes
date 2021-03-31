import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nintyminutesflutter/config/palette.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const PasswordFieldWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          controller: widget.controller,
          obscureText: isHidden,
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.lightGrey,
            hintText: 'Password',
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Palette.darkerGrey),
            ),
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Palette.primary),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Palette.primary,
            ),
            suffixIcon: IconButton(
              icon: isHidden
                  ? Icon(
                      Icons.visibility_off,
                      color: Palette.primary,
                    )
                  : Icon(
                      Icons.visibility,
                      color: Palette.primary,
                    ),
              onPressed: togglePasswordVisibility,
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
          autofillHints: [AutofillHints.password],
          onEditingComplete: () => TextInput.finishAutofillContext(),
          validator: (password) => password != null && password.length < 5
              ? 'Enter min. 5 characters'
              : null,
        ),
      );

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
