import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../config/palette.dart';
import '../../../providers/teamProvider.dart';
import '../../../models/team.dart' as team;
import '../../../models/fixture.dart' as fixture;
import '../../../models/league.dart' as league;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var teamData = Provider.of<TeamProvider>(context);
    List<team.Response> _team = teamData.team.data?.response;
    List<fixture.Response> _last10 = teamData.last10?.data?.response;
    List<fixture.Response> _featured = teamData.featured?.data?.response;
    List<league.Response> _league = teamData.league?.data?.response;
    if (teamData.team.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (teamData.team.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomText(
              text: 'Recent Form',
              size: 20,
              weight: FontWeight.w700,
            ),
            Container(
              color: Palette.darkerGrey,
              child: Column(
                children: [
                  if (_last10 != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _last10.map((match) {
                        return Expanded(
                          child: Container(
                            child: Image.network(
                              (match.teams.home.id == _team[0].team.id)
                                  ? match.teams.away.logo
                                  : match.teams.home.logo,
                              height: 80,
                              width: 60,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  if (_last10 != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _last10.map((match) {
                        return Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: (match.teams.home.id == _team[0].team.id)
                                  ? (match.teams.home.winner == null)
                                      ? Palette.lightGrey
                                      : match.teams.home.winner
                                          ? Palette.primary
                                          : Palette.lose
                                  : (match.teams.away.winner == null)
                                      ? Palette.lightGrey
                                      : match.teams.away.winner
                                          ? Palette.primary
                                          : Palette.lose,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                width: 3.0,
                                color: Palette.darkerGrey,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Featured Match',
              size: 20,
              weight: FontWeight.w700,
            ),
            if (_featured != null)
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(14.0),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                              _featured[i].league.logo ??
                                  "https://media.api-sports.io/football/leagues/4.png",
                              height: 30,
                              width: 30,
                            ),
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: _featured[i].league.country,
                                      size: 12,
                                    ),
                                    CustomText(
                                      text: _featured[i].league.name,
                                      weight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Palette.darkerGrey,
                            thickness: .5,
                          ),
                          ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Text(
                                    '${_featured[i].fixture.date}'
                                        .substring(11, 16),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Palette.darkerGrey,
                                  thickness: 1,
                                ),
                              ],
                            ),
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _featured[i].teams.home.name,
                                    ),
                                    Text(
                                      _featured[i].teams.away.name,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                VerticalDivider(
                                  color: Palette.darkerGrey,
                                  thickness: 1,
                                ),
                                Icon(
                                  Icons.notifications,
                                  color: Palette.darkerGrey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Provider.of<FixtureDetailsProvider>(context,
                              listen: false)
                          .setId(_featured[i].fixture.id);
                      Provider.of<OddProvider>(context, listen: false)
                          .setId(_featured[i].fixture.id);
                      Navigator.pushNamed(
                        context,
                        '/fixture',
                      );
                    },
                  );
                },
                itemCount: _featured.length,
              ),
            SizedBox(
              height: 15,
            ),
            CustomText(
              text: 'Trounaments',
              size: 20,
              weight: FontWeight.w700,
            ),
            if (_league != null)
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _league.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: .5,
                ),
                itemBuilder: (context, i) {
                  return Container(
                    padding: EdgeInsets.only(top: 16),
                    child: Image.network(
                      _league[i].league.logo,
                    ),
                  );
                },
              ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      CustomText(
                        text: 'Venue',
                        size: 20,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Name ',
                        size: 16,
                      ),
                      CustomText(
                        text: _team[0].venue.name,
                        size: 13,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Location ',
                        size: 16,
                      ),
                      CustomText(
                        text: _team[0].venue.city,
                        size: 13,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Image.network(
                    (_team[0].venue.id != null)
                        ? 'https://media.api-sports.io/football/venues/${_team[0].venue.id}.png'
                        : 'https://media.api-sports.io/football/leagues/304.png',
                    width: (screenSize.width - 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (teamData.team.status == NetworkStatus.ERROR) {
      return Text("Error : ${teamData.team.message}");
    } else {
      return Text("${teamData.team.message}");
    }
  }
}
