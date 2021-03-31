import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../config/palette.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SpinKitFadingCube(
          color: Palette.primary,
          size: 40,
        ));
  }
}
