import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/fixtureProvider.dart';
import '../../providers/authProvider.dart';
import '../../config/palette.dart';
import 'widget/details.dart';
import 'widget/lineup.dart';
import 'widget/standings.dart';
import 'widget/matches/matches.dart';
import 'widget/matches/h2h.dart';

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
    var authProvider = Provider.of<AuthProvider>(context);
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    return Container(
      child: Consumer<FixtureDetailsProvider>(
        builder: (context, person, child) {
          return DefaultTabController(
            length: fixtureDetailData.tabControllerLength,
            child: Scaffold(
              appBar: AppBar(
                title: Text("90 MINUTES"),
                actions: [
                  Consumer<AuthProvider>(
                    builder: (context, person, child) {
                      return IconButton(
                        icon: Icon(
                          (fixtureDetailData.fixture.data != null)
                              ? (authProvider.favorite.contains(
                                      fixtureDetailData
                                          .fixture.data.response[0].fixture.id))
                                  ? Icons.notifications_active
                                  : Icons.notifications
                              : Icons.notifications,
                          color: Palette.white,
                        ),
                        onPressed: () {
                          if (authProvider.isLoggedIn) {
                            if (authProvider.favorite.contains(fixtureDetailData
                                .fixture.data.response[0].fixture.id)) {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .removeFromFovorite(
                                      authProvider.id,
                                      fixtureDetailData
                                          .fixture.data.response[0].fixture.id);
                            } else {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .addToFovorite(
                                      authProvider.id,
                                      fixtureDetailData
                                          .fixture.data.response[0].fixture.id);
                            }
                          } else {
                            Navigator.pushNamed(
                              context,
                              '/login',
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Palette.primary,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  indicatorWeight: 4.0,
                  tabs: [
                    Tab(text: "DETAILS"),
                    if (fixtureDetailData.isLineup) Tab(text: "LINEUPS"),
                    if (fixtureDetailData.isStanding) Tab(text: "STANDINGS"),
                    Tab(text: "MATCHES"),
                    Tab(text: "H2H"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Details(),
                  if (fixtureDetailData.isLineup) Lineup(),
                  if (fixtureDetailData.isStanding) Standings(),
                  Matches(),
                  H2H(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
