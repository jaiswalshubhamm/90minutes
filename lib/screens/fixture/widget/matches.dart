import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../models/fixture.dart' as fixture;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);

    List<fixture.Response> homeLast5 =
        fixtureDetailData.homeLast5?.data?.response;
    List<fixture.Response> awayLast5 =
        fixtureDetailData.awayLast5?.data?.response;
    if (fixtureDetailData.homeLast5?.status != NetworkStatus.COMPLETED ||
        fixtureDetailData.fixture.status != NetworkStatus.COMPLETED ||
        fixtureDetailData.awayLast5.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.homeLast5?.status == NetworkStatus.COMPLETED &&
        fixtureDetailData.awayLast5?.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Home Last 5 Matches',
                  color: Palette.primary,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ),
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
                            homeLast5[i].league.logo ??
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
                                    text: homeLast5[i].league.country,
                                    size: 12,
                                  ),
                                  CustomText(
                                    text: homeLast5[i].league.name,
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
                                  homeLast5[i].fixture.date.substring(11, 16),
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
                                    homeLast5[i].teams.home.name,
                                  ),
                                  Text(
                                    homeLast5[i].teams.away.name,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${homeLast5[i].goals.home ?? ''}',
                                  ),
                                  Text(
                                    '${homeLast5[i].goals.away ?? ''}',
                                  ),
                                ],
                              ),
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
                    Provider.of<FixtureDetailsProvider>(context, listen: false)
                        .setId(homeLast5[i].fixture.id);
                    Provider.of<OddProvider>(context, listen: false)
                        .setId(homeLast5[i].fixture.id);
                    Navigator.pushNamed(
                      context,
                      '/fixture',
                    );
                  },
                );
              },
              itemCount: homeLast5.length,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Away Last 5 Matches',
                  color: Palette.primary,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ),
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
                            awayLast5[i].league.logo ??
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
                                    text: awayLast5[i].league.country,
                                    size: 12,
                                  ),
                                  CustomText(
                                    text: awayLast5[i].league.name,
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
                                  awayLast5[i].fixture.date.substring(11, 16),
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
                                    awayLast5[i].teams.home.name,
                                  ),
                                  Text(
                                    awayLast5[i].teams.away.name,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${awayLast5[i].goals.home ?? ''}',
                                  ),
                                  Text(
                                    '${awayLast5[i].goals.away ?? ''}',
                                  ),
                                ],
                              ),
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
                    Provider.of<FixtureDetailsProvider>(context, listen: false)
                        .setId(awayLast5[i].fixture.id);
                    Provider.of<OddProvider>(context, listen: false)
                        .setId(awayLast5[i].fixture.id);
                    Navigator.pushNamed(
                      context,
                      '/fixture',
                    );
                  },
                );
              },
              itemCount: homeLast5.length,
            ),
          ],
        ),
      );
    } else if (fixtureDetailData.homeLast5?.status == NetworkStatus.ERROR &&
        fixtureDetailData.awayLast5?.status == NetworkStatus.ERROR) {
      return Text("Error : ${fixtureDetailData.awayLast5.message}");
    } else {
      return Text("${fixtureDetailData.homeLast5.message}");
    }
  }
}
