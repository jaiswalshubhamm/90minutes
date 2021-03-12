// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/config/palette.dart';
import 'package:nintyminutesflutter/screens/home/widgets/leagues.dart';
import 'package:nintyminutesflutter/screens/home/widgets/matches.dart';
import 'package:nintyminutesflutter/widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text(
            "90MINUTES",
            style: TextStyle(color: Palette.white),
          ),
          backgroundColor: Palette.primary,
          elevation: 20.0,
          actions: [
            IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.calendar_view_day),
              onPressed: () => {},
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
            leagues(),
            matches(),
            matches(),
          ],
        ),
      ),
    );
  }
}
