import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/playerProvider.dart';
import '../../models/players.dart' as player;
import '../../config/palette.dart';
import '../../widgets/customText.dart';
import 'widget/details.dart';
// import 'widgets/matches.dart';
// import 'widgets/standings/standings.dart';
// import 'widgets/statistics.dart';
import 'package:nintyminutesflutter/screens/home/widgets/favorites.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var playerData = Provider.of<PlayerProvider>(context);
    List<player.Response> _player = playerData.players.data?.response;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Palette.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 116,
                elevation: 20.0,
                backgroundColor: Palette.primary,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: CustomText(
                    text: (_player != null)
                    ? _player[0].player.name
                    : 'Player Info',
                    // text: _player[0].player.name,
                    bgColor: Palette.primary,
                    color: Palette.white,
                    weight: FontWeight.w600,
                    size: 14,
                  ),
                  background: Container(
                    color: Palette.primary,
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
                    indicatorColor: Palette.white,
                    tabs: [
                      Tab(text: "DETAILS"),
                      Tab(text: "STATISTICS"),
                      Tab(text: "MATCHES"),
                    ],
                    unselectedLabelColor: Palette.lightGrey,
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Details(),
              favorites(),
              favorites(),
            ],
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
