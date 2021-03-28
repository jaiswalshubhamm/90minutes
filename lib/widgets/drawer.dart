import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/authProvider.dart';
import 'darkMode.dart';
import 'customText.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var authData = Provider.of<AuthProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dlogo.png"),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  (authData.isLoggedIn || isAuth)
                      ? 'Welcome ${authData.name} !'
                      : "Welcome Guest !",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: CustomText(
              text: 'Home',
              size: 18,
              weight: FontWeight.w700,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: CustomText(
              text: 'Feedback',
              size: 18,
              weight: FontWeight.w700,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/feedback');
            },
          ),
          if (!(authData.isLoggedIn || isAuth))
            ListTile(
              leading: Icon(Icons.login),
              title: CustomText(
                text: 'SignIn',
                size: 18,
                weight: FontWeight.w700,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/login');
              },
            ),
          if (authData.isLoggedIn || isAuth)
            ListTile(
              leading: Icon(Icons.logout),
              title: CustomText(
                text: 'SignOut',
                size: 18,
                weight: FontWeight.w700,
              ),
              onTap: () {
                authData.logout();
                Navigator.of(context).pushNamed('/');
              },
            ),
          ListTile(
            leading: ChangeThemeButtonWidget(),
          ),
        ],
      ),
    );
  }
}
