import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../providers/authProvider.dart';
import '../../../models/fixtures.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

Widget refreshBg() {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Palette.primary,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.delete,
          size: 30,
          color: Palette.white,
        ),
        Icon(
          Icons.delete,
          size: 30,
          color: Palette.white,
        ),
      ],
    ),
  );
}

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    List<Response> _fixtures = authProvider.favoriteMatches;

    if (!authProvider.isLoggedIn) {
      return Center(child: Loading());
    } else if (authProvider.favoriteMatches.length < 0) {
      return Center(
        child: CustomText(
          text: 'No matches',
        ),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              Provider.of<AuthProvider>(context, listen: false)
                  .removeFromFovorite(authProvider.id, _fixtures[i].fixture.id);
              setState(() {
                _fixtures.removeAt(i);
              });
            },
            background: refreshBg(),
            child: GestureDetector(
              child: Card(
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
                      // trailing: Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Column(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Text(
                      //           '${_fixtures[i].goals.home ?? ''}',
                      //         ),
                      //         Text(
                      //           '${_fixtures[i].goals.away ?? ''}',
                      //         ),
                      //       ],
                      //     ),
                      //     VerticalDivider(
                      //       color: Palette.darkerGrey,
                      //       thickness: 1,
                      //     ),
                      //     // Consumer<AuthProvider>(
                      //     //   builder: (context, person, child) {
                      //     //     return IconButton(
                      //     //       icon: Icon(
                      //     //         authProvider.favorite
                      //     //                 .contains(_fixtures[i].fixture.id)
                      //     //             ? Icons.notifications_active
                      //     //             : Icons.notifications,
                      //     //         color: authProvider.favorite.contains(
                      //     //           _fixtures[i].fixture.id,
                      //     //         )
                      //     //             ? Palette.primary
                      //     //             : Palette.darkerGrey,
                      //     //       ),
                      //     //       onPressed: () {
                      //     //         if (authProvider.isLoggedIn) {
                      //     //           if (authProvider.favorite.contains(
                      //     //               _fixtures[i].fixture.id)) {
                      //     //             Provider.of<AuthProvider>(context,
                      //     //                     listen: false)
                      //     //                 .removeFromFovorite(
                      //     //                     authProvider.id,
                      //     //                     _fixtures[i].fixture.id);
                      //     //           } else {
                      //     //             Provider.of<AuthProvider>(context,
                      //     //                     listen: false)
                      //     //                 .addToFovorite(authProvider.id,
                      //     //                     _fixtures[i].fixture.id);
                      //     //           }
                      //     //         } else {
                      //     //           Navigator.pushNamed(
                      //     //             context,
                      //     //             '/login',
                      //     //           );
                      //     //         }
                      //     //       },
                      //     //     );
                      //     //   },
                      //     // ),
                      //   ],
                      // ),
                    ),
                  ],
                ),
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
            ),
          );
        },
        itemCount: _fixtures.length,
      );
    }
  }
}
