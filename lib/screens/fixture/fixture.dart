import 'package:flutter/material.dart';
import '../../config/palette.dart';
import '../../screens/home/widgets/favorites.dart';
import 'widget/details.dart';

class FixtureScreen extends StatefulWidget {
  final int id;
  const FixtureScreen({Key key, this.id}) : super(key: key);
  @override
  _FixtureScreenState createState() => _FixtureScreenState();
}

class _FixtureScreenState extends State<FixtureScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
              icon: Icon(Icons.notifications_none_outlined),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Palette.primary,
            isScrollable: true,
            tabs: [
              Tab(text: "DETAILS"),
              Tab(text: "LINEUPS"),
              Tab(text: "STANDINGS"),
              Tab(text: "MATCHES"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Details(),
            favorites(),
            favorites(),
            favorites(),
          ],
        ),
      ),
    );
  }
}
