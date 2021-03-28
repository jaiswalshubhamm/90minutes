import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/teamProvider.dart';
import '../../models/team.dart' as team;
import '../../config/palette.dart';
import '../../widgets/customText.dart';
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
              backgroundColor: Palette.white,
              appBar: AppBar(
                title: CustomText(
                  text: _team != null ? _team[0].team.name : 'Team Info',
                  bgColor: Palette.primary,
                  color: Palette.white,
                  weight: FontWeight.w600,
                ),
                backgroundColor: Palette.primary,
                elevation: 20.0,
                bottom: TabBar(
                  indicatorColor: Palette.primary,
                  isScrollable: true,
                  tabs: [
                    Tab(text: "DETAILS"),
                    Tab(text: "MATCHES"),
                    if (teamData.isStanding) Tab(text: "STANDINGS"),
                    if (teamData.isStatistics) Tab(text: "STATISTICS"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Details(),
                  Matches(),
                  if (teamData.isStanding) Standings(),
                  if (teamData.isStatistics) Statistics(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     var teamData = Provider.of<TeamProvider>(context);
//     List<team.Response> _team = teamData.team.data?.response;
//     return Container(
//       child: Consumer<TeamProvider>(
//         builder: (context, person, child) {
//           return DefaultTabController(
//             length: teamData.tabControllerLength,
//             child: Scaffold(
//               backgroundColor: Palette.white,
//               body: NestedScrollView(
//                 headerSliverBuilder:
//                     (BuildContext context, bool innerBoxIsScrolled) {
//                   return [
//                     SliverAppBar(
//                       // pinned: true,
//                       expandedHeight: 120,
//                       backgroundColor: Palette.primary,
//                       flexibleSpace: FlexibleSpaceBar(
//                         centerTitle: true,
//                         title: CustomText(
//                           text: 'Team Info',
//                           bgColor: Palette.primary,
//                           size: 20,
//                           color: Palette.white,
//                           weight: FontWeight.w700,
//                         ),
//                         background: Container(
//                           color: Palette.primary,
//                           child: Center(
//                             child: Image.network(
//                               (_team != null)
//                                   ? _team[0].team.logo
//                                   : 'https://media.api-sports.io/football/leagues/340.png',
//                               height: 60,
//                             ),
//                           ),
//                         ),
//                       ),
//                       bottom: TabBar(
//                         indicatorColor: Palette.primary,
//                         isScrollable: true,
//                         tabs: [
//                           Tab(text: "DETAILS"),
//                           Tab(text: "MATCHES"),
//                           if (teamData.isStanding) Tab(text: "STANDINGS"),
//                           // if (teamData.isTopPlayers) Tab(text: "TOP PLAYERS"),
//                         ],
//                         indicatorSize: TabBarIndicatorSize.label,
//                         labelColor: Colors.black87,
//                         unselectedLabelColor: Colors.grey,
//                       ),
//                     ),
//                     // SliverPersistentHeader(
//                     //   delegate: _SliverAppBarDelegate(
//                     //     TabBar(
//                     //       indicatorColor: Palette.primary,
//                     //       isScrollable: true,
//                     //       tabs: [
//                     //         Tab(text: "DETAILS"),
//                     //         Tab(text: "MATCHES"),
//                     //         if (teamData.isStanding) Tab(text: "STANDINGS"),
//                     //         // if (teamData.isTopPlayers) Tab(text: "TOP PLAYERS"),
//                     //       ],
//                     //       indicatorSize: TabBarIndicatorSize.label,
//                     //       labelColor: Colors.black87,
//                     //       unselectedLabelColor: Colors.grey,
//                     //     ),
//                     //   ),
//                     //   pinned: true,
//                     // ),
//                   ];
//                 },
//                 body: TabBarView(
//                   children: [
//                     Details(),
//                     Matches(),
//                     if (teamData.isStanding) Standings(),
//                     // if (leagueDetailData.isTopPlayers) TopPlayer(),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar tabBar;

//   _SliverAppBarDelegate(this.tabBar);

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Palette.primary,
//       child: tabBar,
//     );
//   }

//   @override
//   double get maxExtent => tabBar.preferredSize.height;

//   @override
//   double get minExtent => tabBar.preferredSize.height;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
