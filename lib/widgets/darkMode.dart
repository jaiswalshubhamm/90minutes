import 'package:flutter/material.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import '../providers/themeProvider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );

    // return LiteRollingSwitch(
    //   //initial value
    //   value: themeProvider.isDarkMode,
    //   textOn: 'Night',
    //   textOff: 'day',
    //   colorOn: Colors.black,
    //   colorOff: Colors.greenAccent[700],
    //   iconOn: Icons.ac_unit,
    //   iconOff: Icons.wb_sunny,
    //   textSize: 17.0,
    //   onChanged: (value) {
    //     //Use it to manage the different states
    //     final provider = Provider.of<ThemeProvider>(context, listen: false);
    //     provider.toggleTheme(value);
    //   },
    // );
  }
}
