import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/authProvider.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../providers/leagueProvider.dart';
import '../../../models/league.dart' as league;
import '../../../models/fixture.dart' as fixture;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var leagueDetailData = Provider.of<LeagueDetailsProvider>(context);
    List<league.Response> _league = leagueDetailData.league.data?.response;
    List<fixture.Response> _featured =
        leagueDetailData.featured?.data?.response;
    if (leagueDetailData.league.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (leagueDetailData.league.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Palette.white,
                  child: Image.network(
                    _league[0].league.logo ??
                        "https://media.api-sports.io/football/leagues/4.png",
                    width: 60,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          '${_league[0].league.type},  ${_league[0].league.name}',
                      size: 20,
                      color: Palette.primary,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        if (_league[0].country.flag != null)
                          SvgPicture.network(
                            _league[0].country.flag,
                            height: 20,
                          ),
                        SizedBox(width: 10),
                        CustomText(
                          text: '${_league[0].country.name}',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: CustomText(
                text: 'Featured Match',
                size: 20,
                color: Palette.primary,
                weight: FontWeight.bold,
              ),
            ),
            if (_featured != null)
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              leading: Container(
                                color: Palette.lightGrey,
                                child: Image.network(
                                  _featured[i].league.logo ??
                                      "https://media.api-sports.io/football/leagues/4.png",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            if (_league[0].country.flag != null)
                                              SvgPicture.network(
                                                _league[0].country.flag,
                                                height: 10,
                                              ),
                                            SizedBox(width: 6),
                                            CustomText(
                                              text: _featured[i].league.country,
                                              size: 12,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        CustomText(
                                          text: _featured[i].league.name,
                                          weight: FontWeight.bold,
                                          color: Palette.primary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Palette.darkerGrey,
                              thickness: .5,
                            ),
                            ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('${_featured[i].fixture.date}'
                                      .substring(11, 16)),
                                  VerticalDivider(
                                    color: Palette.darkerGrey,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _featured[i].teams.home.name,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          _featured[i].teams.away.name,
                                        ),
                                      ],
                                    ),
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
                                        '${_featured[i].goals.home ?? ''}',
                                      ),
                                      Text(
                                        '${_featured[i].goals.away ?? ''}',
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Palette.darkerGrey,
                                    thickness: 1,
                                  ),
                                  Consumer<AuthProvider>(
                                    builder: (context, person, child) {
                                      return IconButton(
                                        icon: Icon(
                                          authProvider.favorite.contains(
                                                  _featured[i].fixture.id)
                                              ? Icons.notifications_active
                                              : Icons.notifications,
                                          color: authProvider.favorite.contains(
                                            _featured[i].fixture.id,
                                          )
                                              ? Palette.primary
                                              : Palette.darkerGrey,
                                        ),
                                        onPressed: () {
                                          if (authProvider.isLoggedIn) {
                                            if (authProvider.favorite.contains(
                                                _featured[i].fixture.id)) {
                                              Provider.of<AuthProvider>(context,
                                                      listen: false)
                                                  .removeFromFovorite(
                                                      authProvider.id,
                                                      _featured[i].fixture.id);
                                            } else {
                                              Provider.of<AuthProvider>(context,
                                                      listen: false)
                                                  .addToFovorite(
                                                      authProvider.id,
                                                      _featured[i].fixture.id);
                                            }
                                          } else {
                                            Navigator.pushNamed(
                                              context,
                                              '/login',
                                            );
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                itemCount: _featured?.length,
              )
          ],
        ),
      );
    } else if (leagueDetailData.league.status == NetworkStatus.ERROR) {
      return Text("Error : ${leagueDetailData.league.message}");
    } else {
      return Text("${leagueDetailData.league.message}");
    }
  }
}
