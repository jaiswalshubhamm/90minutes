import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/config/palette.dart';
import 'package:nintyminutesflutter/screens/home/widgets/favorites.dart';
import 'package:nintyminutesflutter/widgets/drawer.dart';

class LeagueScreen extends StatefulWidget {
  final int id;
  const LeagueScreen({Key key, this.id}) : super(key: key);
  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text(
            "90 MINUTES",
            style: TextStyle(color: Palette.white),
          ),
          backgroundColor: Palette.primary,
          elevation: 20.0,
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "LEAUGES"),
              Tab(text: "MATCHES"),
              Tab(text: "FAVORITES"),
            ],
          ),
        ),
        drawer: Drawer(
          child: MenuDrawer(),
        ),
        body: TabBarView(
          children: [
            favorites(),
            favorites(),
            favorites(),
          ],
        ),
      ),
    );
  }
}
