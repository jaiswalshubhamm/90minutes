import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/leagueProvider.dart';
import '../../../providers/playerProvider.dart';
import '../../../models/players.dart' as player;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class TopPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var leagueDetailData = Provider.of<LeagueDetailsProvider>(context);
    List<player.Response> _players = leagueDetailData.players.data?.response;
    if (leagueDetailData.players.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (leagueDetailData.players.status == NetworkStatus.COMPLETED) {
      return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      _players[i].player.photo ??
                          "https://media.api-sports.io/football/leagues/4.png",
                      // height: 30,
                    ),
                  ),
                  VerticalDivider(
                    color: Palette.darkerGrey,
                    thickness: .5,
                  ),
                ],
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: _players[i].player.name,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.network(
                        _players[i].statistics[0].team.logo ??
                            "https://media.api-sports.io/football/leagues/4.png",
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: CustomText(
                          text: _players[i].statistics[0].team.name,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              trailing: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Palette.primary,
                ),
                child: CustomText(
                  text: (_players[i].statistics[0].games.rating != null)
                      ? _players[i].statistics[0].games.rating.substring(0, 4)
                      : '0',
                  bgColor: Palette.primary,
                  color: Palette.white,
                ),
              ),
              onTap: () {
                Provider.of<PlayerProvider>(context, listen: false)
                    .setPlayerParams(_players[i].player.id,
                        '${_players[i].statistics.last.league.season}');
                Navigator.pushNamed(
                  context,
                  '/player',
                );
              },
            ),
          );
        },
        itemCount: _players.length,
      );
    } else if (leagueDetailData.players.status == NetworkStatus.ERROR) {
      return Text("Error : ${leagueDetailData.players.message}");
    } else {
      return Text("${leagueDetailData.players.message}");
    }
  }
}
