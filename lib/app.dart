import 'package:flutter/material.dart';

import 'screens/home/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '90Minutes',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}





// class CheckAuth extends StatefulWidget {
//   @override
//   _CheckAuthState createState() => _CheckAuthState();
// }

// class _CheckAuthState extends State<CheckAuth> {
//   bool isAuth = false;
//   @override
//   void initState() {
//     _checkIfLoggedIn();
//     super.initState();
//   }

//   void _checkIfLoggedIn() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var token = localStorage.getString('token');
//     if (token != null) {
//       setState(() {
//         isAuth = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget child;
//     if (isAuth) {
//       child = DashBoard();
//     } else {
//       child = Home();
//     }
//     return Scaffold(
//       body: child,
//     );
//   }
// }
