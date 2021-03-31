import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../config/palette.dart';

class NameFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const NameFieldWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _NameFieldWidgetState createState() => _NameFieldWidgetState();
}

class _NameFieldWidgetState extends State<NameFieldWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Name',
            filled: true,
            fillColor: Palette.lightGrey,
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Palette.darkerGrey),
            ),
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Palette.primary),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Palette.primary,
            ),
            suffixIcon: widget.controller.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: Icon(Icons.close, color: Palette.black),
                    onPressed: () => widget.controller.clear(),
                  ),
          ),
          keyboardType: TextInputType.name,
          autofillHints: [AutofillHints.name],
          autofocus: true,
          validator: (name) =>
              name != null && name.length >= 4 ? 'Enter a valid Name' : null,
        ),
      );
}
