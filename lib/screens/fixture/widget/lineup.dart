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
                        id: _fixture[0].lineups[0].startXi[0].player.id,
                        name: _fixture[0].lineups[0].startXi[0].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[0].startXi[0].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXi[1].player.id,
                        name: _fixture[0].lineups[0].startXi[1].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[1].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXi[2].player.id,
                        name: _fixture[0].lineups[0].startXi[2].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[2].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXi[3].player.id,
                        name: _fixture[0].lineups[0].startXi[3].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[3].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXi[4].player.id,
                        name: _fixture[0].lineups[0].startXi[4].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[4].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXi[5].player.id,
                        name: _fixture[0].lineups[0].startXi[5].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[5].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXi[6].player.id,
                        name: _fixture[0].lineups[0].startXi[6].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[6].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXi[7].player.id,
                        name: _fixture[0].lineups[0].startXi[7].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[7].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXi[8].player.id,
                        name: _fixture[0].lineups[0].startXi[8].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[8].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[0].startXi[9].player.id,
                        name: _fixture[0].lineups[0].startXi[9].player.name,
                        image: 'assets/images/homePlayer.png',
                        number: _fixture[0].lineups[0].startXi[9].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        id: _fixture[0].lineups[0].startXi[10].player.id,
                        name: _fixture[0].lineups[0].startXi[10].player.name,
                        image: 'assets/images/homePlayer.png',
                        number:
                            _fixture[0].lineups[0].startXi[10].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXi[10].player.id,
                        name: _fixture[0].lineups[1].startXi[10].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number:
                            _fixture[0].lineups[1].startXi[10].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXi[9].player.id,
                        name: _fixture[0].lineups[1].startXi[9].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[9].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXi[8].player.id,
                        name: _fixture[0].lineups[1].startXi[8].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[8].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXi[7].player.id,
                        name: _fixture[0].lineups[1].startXi[7].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[7].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXi[6].player.id,
                        name: _fixture[0].lineups[1].startXi[6].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[6].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXi[5].player.id,
                        name: _fixture[0].lineups[1].startXi[5].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[5].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXi[4].player.id,
                        name: _fixture[0].lineups[1].startXi[4].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[4].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXi[3].player.id,
                        name: _fixture[0].lineups[1].startXi[3].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[3].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXi[2].player.id,
                        name: _fixture[0].lineups[1].startXi[2].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[2].player.number,
                      ),
                      Player(
                        id: _fixture[0].lineups[1].startXi[1].player.id,
                        name: _fixture[0].lineups[1].startXi[1].player.name,
                        image: 'assets/images/homeGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[1].player.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player(
                        id: _fixture[0].lineups[1].startXi[0].player.id,
                        name: _fixture[0].lineups[1].startXi[0].player.name,
                        image: 'assets/images/awayGoalkeeper.png',
                        number: _fixture[0].lineups[1].startXi[0].player.number,
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
              elevation: 5.0,
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
            ListTile(
              leading: CustomText(
                text: 'Coach',
                size: 20,
              ),
              title: CustomText(
                text: _fixture[0].lineups[0].coach.name,
                size: 14,
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemExtent: 25,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: CustomText(
                    text: '${_fixture[0].lineups[0].startXi[i].player.number}',
                    size: 20,
                  ),
                  title: CustomText(
                    text: _fixture[0].lineups[0].startXi[i].player.name,
                    size: 14,
                  ),
                  onTap: () {},
                  // ),
                );
              },
              itemCount: _fixture[0].lineups[0].startXi.length,
            ),
            SizedBox(height: 15),
            Card(
              elevation: 5.0,
              child: ListTile(
                leading: Image.network(
                  _fixture[0].lineups[1].team.logo,
                  height: 80,
                ),
                title: CustomText(
                  text: _fixture[0].lineups[1].team.name,
                  size: 20,
                ),
              ),
            ),
            ListTile(
              leading: CustomText(
                text: 'Coach',
                size: 20,
              ),
              title: CustomText(
                text: _fixture[0].lineups[1].coach.name,
                size: 14,
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemExtent: 25,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: CustomText(
                    text: '${_fixture[0].lineups[1].startXi[i].player.number}',
                    size: 20,
                  ),
                  title: CustomText(
                    text: _fixture[0].lineups[1].startXi[i].player.name,
                    size: 14,
                  ),
                  onTap: () {},
                  // ),
                );
              },
              itemCount: _fixture[0].lineups[1].startXi.length,
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
