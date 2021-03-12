import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/providers/authProvider.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
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
                  (authData.isLoggedIn)
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
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/feedback');
            },
          ),
          if (authData.isLoggedIn == false)
            ListTile(
              leading: Icon(Icons.login),
              title: Text('SignIn'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/login');
              },
            ),
          Divider(),
          if (authData.isLoggedIn)
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('SignOut'),
              onTap: () {
                authData.logout();
                Navigator.of(context).pushNamed('/');
              },
            ),
        ],
      ),
    );
  }
}
