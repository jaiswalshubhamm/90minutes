import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/playerProvider.dart';
import '../../models/players.dart' as player;
import '../../config/palette.dart';
import 'widget/details.dart';
import 'widget/matches.dart';
import 'widget/statistics.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var playerData = Provider.of<PlayerProvider>(context);
    List<player.Response> _player = playerData.players.data?.response;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 116,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(top: 20),
                  title: Text(
                    (_player != null) ? _player[0].player.name : 'Player Info',
                  ),
                  background: Container(
                    child: Center(
                      child: CircleAvatar(
                        radius: 32.0,
                        backgroundImage: NetworkImage(
                          (_player != null)
                              ? _player[0].player.photo
                              : 'https://media.api-sports.io/football/leagues/340.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorWeight: 4.0,
                    indicatorColor: Palette.white,
                    tabs: [
                      Tab(text: "DETAILS"),
                      Tab(text: "STATISTICS"),
                      Tab(text: "MATCHES"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TabBarView(
              children: [
                Details(),
                Statistics(),
                Matches(),
              ],
            ),
          ),
        ),
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
    return Container(
      color: Palette.primary,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
