import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/providers/teamProvider.dart';
import 'package:provider/provider.dart';
import '../../config/palette.dart';
import '../../widgets/customText.dart';
import 'widgets/details.dart';
// import 'widget/details.dart';
// import 'widget/standings/standings.dart';
// import 'widget/topPlayer.dart';
// import 'widget/matches.dart';

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
    return Container(
      child: Consumer<TeamProvider>(
        builder: (context, person, child) {
          return DefaultTabController(
            length: teamData.tabControllerLength,
            child: Scaffold(
              backgroundColor: Palette.white,
              // appBar: AppBar(
              //   title: CustomText(
              //     text: 'Team Info',
              //     bgColor: Palette.primary,
              //     size: 20,
              //     color: Palette.white,
              //     weight: FontWeight.w700,
              //   ),
              //   backgroundColor: Palette.primary,
              //   elevation: 20.0,
              //   bottom: TabBar(
              //     indicatorColor: Palette.primary,
              //     isScrollable: true,
              //     tabs: [
              //       Tab(text: "DETAILS"),
              //       // Tab(text: "MATCHES"),
              //       // if (teamData.isStanding) Tab(text: "STANDINGS"),
              //       // if (teamData.isTopPlayers) Tab(text: "TOP PLAYERS"),
              //     ],
              //   ),
              // ),
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 120,
                      backgroundColor: Palette.primary,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: CustomText(
                          text: 'Team Info',
                          bgColor: Palette.primary,
                          size: 20,
                          color: Palette.white,
                          weight: FontWeight.w700,
                        ),
                        // background: Image.asset(
                        //   "assets/images/footballField.png",
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          tabs: [
                            Tab(text: "DETAILS"),
                            // Tab(text: "MATCHES"),
                            // if (teamData.isStanding) Tab(text: "STANDINGS"),
                            // if (teamData.isTopPlayers) Tab(text: "TOP PLAYERS"),
                          ],
                          isScrollable: false,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.grey,
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    Details(),
                    //     // Matches(),
                    //     // if (teamData.isStanding) Standings(),
                    //     // if (leagueDetailData.isTopPlayers) TopPlayer(),
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      child: tabBar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
