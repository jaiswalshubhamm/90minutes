import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../models/fixture.dart' as fixture;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';
import 'player.dart';

class Lineup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    List<fixture.Response> _fixture = fixtureDetailData.fixture.data?.response;
    if (fixtureDetailData.fixture.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.fixture.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 35,
              color: Palette.secondary,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: CustomText(
                bgColor: Palette.secondary,
                text: _fixture[0].teams.away.name,
                color: Palette.white,
                weight: FontWeight.w700,
              ),
            ),
            Container(
              height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/footballField.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        player: _fixture[0].lineups[0].startXi[0].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        player: _fixture[0].lineups[0].startXi[1].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[0].startXi[2].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[0].startXi[3].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[0].startXi[4].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        player: _fixture[0].lineups[0].startXi[5].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[0].startXi[6].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        player: _fixture[0].lineups[0].startXi[7].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[0].startXi[8].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[0].startXi[9].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        player: _fixture[0].lineups[0].startXi[10].player,
                        image: 'assets/images/homePlayer.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        player: _fixture[0].lineups[1].startXi[10].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        player: _fixture[0].lineups[1].startXi[9].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[1].startXi[8].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[1].startXi[7].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        player: _fixture[0].lineups[1].startXi[6].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[1].startXi[5].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        player: _fixture[0].lineups[1].startXi[4].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[1].startXi[3].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[1].startXi[2].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                      Player(
                        player: _fixture[0].lineups[1].startXi[1].player,
                        image: 'assets/images/homeGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                  SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        player: _fixture[0].lineups[1].startXi[0].player,
                        image: 'assets/images/awayGoalkeeper.png',
                        season: _fixture[0].league.season,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              color: Palette.secondary,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: CustomText(
                bgColor: Palette.secondary,
                text: _fixture[0].teams.home.name,
                color: Palette.white,
                weight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: Image.network(
                _fixture[0].lineups[0].team.logo,
                height: 30,
              ),
              title: CustomText(
                text: _fixture[0].lineups[0].team.name,
                weight: FontWeight.w700,
                color: Palette.primary,
                size: 20,
              ),
            ),
            DataTable(
              horizontalMargin: 32,
              dataRowHeight: 36,
              columns: <DataColumn>[
                DataColumn(label: Text('#')),
                DataColumn(label: Text('Team')),
              ],
              rows: _fixture[0]
                  .lineups[0]
                  .startXi
                  .map(
                    (player) => DataRow(
                      cells: [
                        DataCell(Text('${player.player.number}')),
                        DataCell(Text(player.player.name)),
                      ],
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: Image.network(
                _fixture[0].lineups[1].team.logo,
                height: 30,
              ),
              title: CustomText(
                text: _fixture[0].lineups[1].team.name,
                weight: FontWeight.w700,
                color: Palette.primary,
                size: 20,
              ),
            ),
            DataTable(
              horizontalMargin: 32,
              dataRowHeight: 40,
              columns: <DataColumn>[
                DataColumn(label: Text('#')),
                DataColumn(label: Text('Team')),
              ],
              rows: _fixture[0]
                  .lineups[1]
                  .startXi
                  .map(
                    (player) => DataRow(
                      cells: [
                        DataCell(Text('${player.player.number}')),
                        DataCell(Text(player.player.name)),
                      ],
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 15),
          ],
        ),
      );
    } else if (fixtureDetailData.fixture.status == NetworkStatus.ERROR) {
      return Text("Error : ${fixtureDetailData.fixture.message}");
    } else {
      return Text("${fixtureDetailData.fixture.message}");
    }
  }
}
