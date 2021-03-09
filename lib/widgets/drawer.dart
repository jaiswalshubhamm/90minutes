import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/config/palette.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Palette.menubg),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(context),
            _buildPortfolioItem(context),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        'Himdeve Fashion',
        style: TextStyle(backgroundColor: Palette.primary),
      ),
      accountEmail: Text(
        'info@himdeve.eu',
        style: TextStyle(backgroundColor: Colors.black),
      ),
      currentAccountPicture: GestureDetector(
        onTap: () => showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Himdeve Fashion'),
            content: Text(
                'To be a designer is a kind of art work. However, to proceed further, to develop a brand and to find a marketplace for the ideas, it is sometimes a struggle. But with a firm determination, love and passion, finally, at the end, a little wish may come true… And that wish is called the Himdeve. The brand designed to be successful.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }

  ListTile _buildPortfolioItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Portfolio',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.work,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.white,
    );
  }
}
