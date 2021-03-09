// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/config/palette.dart';
import 'package:nintyminutesflutter/services/apiManager.dart';
import 'package:nintyminutesflutter/widgets/drawer.dart';

import 'widgets/pageBody.dart';

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
        body: FutureBuilder(
          future: SoccerApi().getAllMatches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print((snapshot.data).length);
              return PageBody(snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
