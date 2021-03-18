import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/screens/fixture/widget/player.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../models/fixture.dart' as fixture;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Lineup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    List<fixture.Response> _fixture = fixtureDetailData.fixture.data?.response;
    if (fixtureDetailData.fixture.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.fixture.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30,
              color: Palette.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: CustomText(
                      bgColor: Palette.secondary,
                      text: _fixture[0].teams.away.name,
                      color: Palette.white,
                    ),
                  ),
                ],
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXI[0].player.id,
                        name: _fixture[0].lineups[0].startXI[0].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[0].startXI[0].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXI[1].player.id,
                        name: _fixture[0].lineups[0].startXI[1].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[1].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXI[2].player.id,
                        name: _fixture[0].lineups[0].startXI[2].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[2].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXI[3].player.id,
                        name: _fixture[0].lineups[0].startXI[3].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[3].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXI[4].player.id,
                        name: _fixture[0].lineups[0].startXI[4].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[4].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXI[5].player.id,
                        name: _fixture[0].lineups[0].startXI[5].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[5].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXI[6].player.id,
                        name: _fixture[0].lineups[0].startXI[6].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[6].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXI[7].player.id,
                        name: _fixture[0].lineups[0].startXI[7].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[7].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXI[8].player.id,
                        name: _fixture[0].lineups[0].startXI[8].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[8].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXI[9].player.id,
                        name: _fixture[0].lineups[0].startXI[9].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXI[9].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXI[10].player.id,
                        name: _fixture[0].lineups[0].startXI[10].player.name,
                        image: 'assets/images/homePlayer.png',
                        number:
                            _fixture[0].lineups[0].startXI[10].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXI[10].player.id,
                        name: _fixture[0].lineups[1].startXI[10].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number:
                            _fixture[0].lineups[1].startXI[10].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXI[9].player.id,
                        name: _fixture[0].lineups[1].startXI[9].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[9].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXI[8].player.id,
                        name: _fixture[0].lineups[1].startXI[8].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[8].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXI[7].player.id,
                        name: _fixture[0].lineups[1].startXI[7].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[7].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXI[6].player.id,
                        name: _fixture[0].lineups[1].startXI[6].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[6].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXI[5].player.id,
                        name: _fixture[0].lineups[1].startXI[5].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[5].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXI[4].player.id,
                        name: _fixture[0].lineups[1].startXI[4].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[4].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXI[3].player.id,
                        name: _fixture[0].lineups[1].startXI[3].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[3].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXI[2].player.id,
                        name: _fixture[0].lineups[1].startXI[2].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[2].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXI[1].player.id,
                        name: _fixture[0].lineups[1].startXI[1].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[1].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXI[0].player.id,
                        name: _fixture[0].lineups[1].startXI[0].player.name,
                        image: 'assets/images/awayGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXI[0].player.number,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              color: Palette.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                    child: CustomText(
                      bgColor: Palette.secondary,
                      text: _fixture[0].teams.home.name,
                      color: Palette.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: Image.network(
                  _fixture[0].lineups[0].team.logo,
                  height: 80,
                ),
                title: CustomText(
                  text: _fixture[0].lineups[0].team.name,
                  size: 20,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CustomText(
                  text: 'Coach',
                  size: 20,
                ),
                title: CustomText(
                  text: _fixture[0].lineups[0].coach.name,
                  size: 16,
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    leading: CustomText(
                      text:
                          '${_fixture[0].lineups[0].startXI[i].player.number}',
                    ),
                    title: CustomText(
                        text:
                          '${_fixture[0].lineups[0].startXI[i].player.number}',
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/leagues',
                      );
                    },
                  ),
                );
              },
              itemCount: _fixture[0].lineups[0].startXI.length,
            )
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
