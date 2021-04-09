import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/authProvider.dart';
import '../../../providers/leagueProvider.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../models/fixture.dart' as fixture;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Matches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var leagueData = Provider.of<LeagueDetailsProvider>(context);
    List<fixture.Response> last10 = leagueData.last10?.data?.response;
    if (leagueData.last10?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (leagueData.last10?.status == NetworkStatus.COMPLETED) {
      return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, i) {
          return GestureDetector(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: Container(
                        color: Palette.lightGrey,
                        child: Image.network(
                          last10[i].league.logo ??
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    if (last10[0].league.flag != null)
                                      SvgPicture.network(
                                        last10[0].league.flag,
                                        height: 10,
                                      ),
                                    SizedBox(width: 3),
                                    CustomText(
                                      text: last10[i].league.country,
                                      size: 12,
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text: last10[i].league.name,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${last10[i].fixture.date}'.substring(11, 16)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  last10[i].teams.home.name,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  last10[i].teams.away.name,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: '${last10[i].goals.home ?? ''}',
                                color:
                                    (last10[i].fixture.status.short == '2H' ||
                                            last10[i].fixture.status.short ==
                                                'HT' ||
                                            last10[i].fixture.status.short ==
                                                '1H')
                                        ? Palette.lose
                                        : Palette.black,
                              ),
                              CustomText(
                                text: '${last10[i].goals.away ?? ''}',
                                color:
                                    (last10[i].fixture.status.short == '2H' ||
                                            last10[i].fixture.status.short ==
                                                'HT' ||
                                            last10[i].fixture.status.short ==
                                                '1H')
                                        ? Palette.lose
                                        : Palette.black,
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
                                  authProvider.favorite
                                          .contains(last10[i].fixture.id)
                                      ? Icons.notifications_active
                                      : Icons.notifications,
                                  color: authProvider.favorite.contains(
                                    last10[i].fixture.id,
                                  )
                                      ? Palette.primary
                                      : Palette.darkerGrey,
                                ),
                                onPressed: () {
                                  if (authProvider.isLoggedIn) {
                                    if (authProvider.favorite
                                        .contains(last10[i].fixture.id)) {
                                      Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .removeFromFovorite(authProvider.id,
                                              last10[i].fixture.id);
                                    } else {
                                      Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .addToFovorite(authProvider.id,
                                              last10[i].fixture.id);
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
              Provider.of<FixtureDetailsProvider>(context, listen: false)
                  .setId(last10[i].fixture.id);
              Provider.of<OddProvider>(context, listen: false)
                  .setId(last10[i].fixture.id);
              Navigator.pushNamed(
                context,
                '/fixture',
              );
            },
          );
        },
        itemCount: last10.length,
      );
    } else if (leagueData.last10?.status == NetworkStatus.ERROR &&
        leagueData.last10?.status == NetworkStatus.ERROR) {
      return Text("Error : ${leagueData.last10.message}");
    } else {
      return Text("${leagueData.last10.message}");
    }
  }
}
