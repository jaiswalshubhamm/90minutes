import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixturesDetailsProvider.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../providers/authProvider.dart';
import '../../../models/fixtures.dart';
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Fixtures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fixturesData = Provider.of<FixturesDetailsProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    List<Response> _fixtures = fixturesData.fixtures.data?.response;

    if (fixturesData.fixtures.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixturesData.fixtures.status == NetworkStatus.COMPLETED) {
      return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return GestureDetector(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                          _fixtures[i].league.logo ??
                              "https://media.api-sports.io/football/leagues/4.png",
                          height: 30,
                          width: 30,
                        ),
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: _fixtures[i].league.country,
                                    size: 12,
                                  ),
                                  CustomText(
                                    text: _fixtures[i].league.name,
                                    weight: FontWeight.bold,
                                    color: Palette.primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(
                                _fixtures[i].fixture.date.substring(11, 16),
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
                                  _fixtures[i].teams.home.name,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _fixtures[i].teams.away.name,
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
                                  '${_fixtures[i].goals.home ?? ''}',
                                ),
                                Text(
                                  '${_fixtures[i].goals.away ?? ''}',
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
                                            .contains(_fixtures[i].fixture.id)
                                        ? Icons.notifications_active
                                        : Icons.notifications,
                                    color: authProvider.favorite.contains(
                                      _fixtures[i].fixture.id,
                                    )
                                        ? Palette.primary
                                        : Palette.darkerGrey,
                                  ),
                                  // icon: Icon(Icons.notifications,
                                  //     color: (authProvider.favorite.contains(
                                  //             _fixtures[i].fixture.id))
                                  //         ? Palette.primary
                                  //         : Palette.darkerGrey),
                                  onPressed: () {
                                    if (authProvider.isLoggedIn) {
                                      if (authProvider.favorite
                                          .contains(_fixtures[i].fixture.id)) {
                                        Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .removeFromFovorite(authProvider.id,
                                                _fixtures[i].fixture.id);
                                      } else {
                                        Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .addToFovorite(authProvider.id,
                                                _fixtures[i].fixture.id);
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
                SizedBox(height: 8),
                Divider(thickness: .6),
              ],
            ),
            onTap: () {
              Provider.of<FixtureDetailsProvider>(context, listen: false)
                  .setId(_fixtures[i].fixture.id);
              Provider.of<OddProvider>(context, listen: false)
                  .setId(_fixtures[i].fixture.id);
              Navigator.pushNamed(
                context,
                '/fixture',
              );
            },
          );
        },
        itemCount: _fixtures.length,
      );
    } else if (fixturesData.fixtures.status == NetworkStatus.ERROR) {
      return Text("Error : ${fixturesData.fixtures.message}");
    } else {
      return Text("${fixturesData.fixtures.message}");
    }
  }
}
