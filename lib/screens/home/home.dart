// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/config/palette.dart';
import 'package:nintyminutesflutter/screens/home/widgets/favorites.dart';
import 'package:nintyminutesflutter/screens/home/widgets/leagues.dart';
import 'package:nintyminutesflutter/screens/home/widgets/matches.dart';
import 'package:nintyminutesflutter/widgets/drawer.dart';

import 'widgets/datePickerWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isSwitched = false;
  TabController _tcontroller;

  @override
  void initState() {
    _tcontroller = TabController(length: 3, vsync: this);
    _tcontroller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
            if (_tcontroller.index == 1)
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    // print(isSwitched);
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            if (_tcontroller.index == 1) DatePickerWidget(),
            if (_tcontroller.index == 2)
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // setState(() {
                  //   _volume += 10;
                  // });
                },
              ),
            if (_tcontroller.index == 2)
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // setState(() {
                  //   _volume += 10;
                  // });
                },
              ),
            if (_tcontroller.index == 2)
              IconButton(
                icon: Icon(Icons.notification_important),
                onPressed: () {
                  // setState(() {
                  //   _volume += 10;
                  // });
                },
              ),
          ],
          bottom: TabBar(
            controller: _tcontroller,
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
          controller: _tcontroller,
          children: [
            Leagues(),
            Matches(),
            favorites(),
          ],
        ),
      ),
    );
  }
}
