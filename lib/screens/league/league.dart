import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/leagueProvider.dart';
import '../../config/palette.dart';
import 'package:nintyminutesflutter/screens/home/widgets/favorites.dart';

import 'widget/details.dart';

class LeagueScreen extends StatefulWidget {
  final int id;
  const LeagueScreen({Key key, this.id}) : super(key: key);
  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<LeagueDetailsProvider>(context, listen: false).call();
  }

  @override
  Widget build(BuildContext context) {
    var leagueDetailData = Provider.of<LeagueDetailsProvider>(context);
    return Container(
      child: Consumer<LeagueDetailsProvider>(
        builder: (context, person, child) {
          return DefaultTabController(
            length: leagueDetailData.tabControllerLength,
            child: Scaffold(
              backgroundColor: Color(0xFFFAFAFA),
              appBar: AppBar(
                title: Text(
                  "90 MINUTES",
                  style: TextStyle(color: Palette.white),
                ),
                backgroundColor: Palette.primary,
                elevation: 20.0,
                bottom: TabBar(
                  indicatorColor: Palette.primary,
                  isScrollable: true,
                  tabs: [
                    Tab(text: "DETAILS"),
                    // if (leagueDetailData.isStanding) Tab(text: "STANDINGS"),
                    if (leagueDetailData.isTopPlayers) Tab(text: "TOP PLAYERS"),
                    Tab(text: "MATCHES"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Details(),
                  // if (leagueDetailData.isStanding) Standings(),
                  if (leagueDetailData.isTopPlayers) favorites(),
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
