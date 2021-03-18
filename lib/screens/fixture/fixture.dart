import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/providers/fixtureProvider.dart';
import 'package:provider/provider.dart';
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
  void initState() {
    super.initState();
    Provider.of<FixtureDetailsProvider>(context, listen: false).call();
  }

  @override
  Widget build(BuildContext context) {
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    return Container(
      child: Consumer<FixtureDetailsProvider>(
        builder: (context, person, child) {
          return DefaultTabController(
            length: fixtureDetailData.tabControllerLength,
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
                    if (fixtureDetailData.isLineup) Tab(text: "LINEUPS"),
                    if (fixtureDetailData.isStanding) Tab(text: "STANDINGS"),
                    Tab(text: "MATCHES"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Details(),
                  if (fixtureDetailData.isLineup) favorites(),
                  if (fixtureDetailData.isStanding) favorites(),
                  favorites(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
