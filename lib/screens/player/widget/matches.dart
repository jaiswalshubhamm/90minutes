import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/playerProvider.dart';
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
    var playerData = Provider.of<PlayerProvider>(context);

    List<fixture.Response> last10 = playerData.last10?.data?.response;
    if (playerData.last10?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (playerData.last10?.status == NetworkStatus.COMPLETED) {
      return ListView.builder(
        padding: EdgeInsets.all(14.0),
        itemBuilder: (context, i) {
          return GestureDetector(
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Image.network(
                      last10[i].league.logo ??
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
                              text: last10[i].league.country,
                              size: 12,
                            ),
                            CustomText(
                              text: last10[i].league.name,
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
                            last10[i].fixture.date.substring(11, 16),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              last10[i].teams.home.name,
                            ),
                            Text(
                              last10[i].teams.away.name,
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${last10[i].goals.home ?? ''}',
                            ),
                            Text(
                              '${last10[i].goals.away ?? ''}',
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
    } else if (playerData.last10?.status == NetworkStatus.ERROR &&
        playerData.last10?.status == NetworkStatus.ERROR) {
      return Text("Error : ${playerData.last10.message}");
    } else {
      return Text("${playerData.last10.message}");
    }
  }
}
