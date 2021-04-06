import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/teamProvider.dart';
import '../../models/team.dart' as team;
import '../../config/palette.dart';
import 'widgets/details.dart';
import 'widgets/matches.dart';
import 'widgets/standings/standings.dart';
import 'widgets/statistics.dart';

class TeamScreen extends StatefulWidget {
  final int id;
  const TeamScreen({Key key, this.id}) : super(key: key);
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TeamProvider>(context, listen: false).call();
  }

  @override
  Widget build(BuildContext context) {
    var teamData = Provider.of<TeamProvider>(context);
    List<team.Response> _team = teamData.team.data?.response;
    return Container(
      child: Consumer<TeamProvider>(
        builder: (context, person, child) {
          return DefaultTabController(
            length: teamData.tabControllerLength,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  _team != null ? _team[0].team.name : 'Team Info',
                ),
                bottom: TabBar(
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  indicatorColor: Palette.white,
                  indicatorWeight: 4.0,
                  tabs: [
                    Tab(text: "DETAILS"),
                    Tab(text: "MATCHES"),
                    if (teamData.isStanding) Tab(text: "STANDINGS"),
                    if (teamData.isStatistics) Tab(text: "STATISTICS"),
                  ],
                ),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TabBarView(
                  children: [
                    Details(),
                    Matches(),
                    if (teamData.isStanding) Standings(),
                    if (teamData.isStatistics) Statistics(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
