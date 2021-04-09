import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/palette.dart';
import '../../../../providers/authProvider.dart';
import '../../../../providers/fixtureProvider.dart';
import '../../../../providers/oddProvider.dart';
import '../../../../widgets/customText.dart';

class MatchTile extends StatelessWidget {
  final List matches;
  final AuthProvider authProvider;

  MatchTile({@required this.matches, this.authProvider});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return GestureDetector(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Image.network(
                      matches[i].league.logo ??
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
                                text: matches[i].league.country,
                                size: 12,
                              ),
                              CustomText(
                                text: matches[i].league.name,
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
                        Text(
                          '${matches[i].fixture.date}'.substring(11, 16),
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
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                matches[i].teams.home.name,
                              ),
                              SizedBox(height: 8),
                              Text(
                                matches[i].teams.away.name,
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
                              text: '${matches[i].goals.home ?? ''}',
                              color: (matches[i].fixture.status.short == '2H' ||
                                      matches[i].fixture.status.short == 'HT' ||
                                      matches[i].fixture.status.short == '1H')
                                  ? Palette.lose
                                  : Palette.black,
                            ),
                            CustomText(
                              text: '${matches[i].goals.away ?? ''}',
                              color: (matches[i].fixture.status.short == '2H' ||
                                      matches[i].fixture.status.short == 'HT' ||
                                      matches[i].fixture.status.short == '1H')
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
                                        .contains(matches[i].fixture.id)
                                    ? Icons.notifications_active
                                    : Icons.notifications,
                                color: authProvider.favorite.contains(
                                  matches[i].fixture.id,
                                )
                                    ? Palette.primary
                                    : Palette.darkerGrey,
                              ),
                              onPressed: () {
                                if (authProvider.isLoggedIn) {
                                  if (authProvider.favorite
                                      .contains(matches[i].fixture.id)) {
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .removeFromFovorite(authProvider.id,
                                            matches[i].fixture.id);
                                  } else {
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .addToFovorite(authProvider.id,
                                            matches[i].fixture.id);
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
                .setId(matches[i].fixture.id);
            Provider.of<OddProvider>(context, listen: false)
                .setId(matches[i].fixture.id);
            Navigator.pushNamed(
              context,
              '/fixture',
            );
          },
        );
      },
      itemCount: matches.length,
    );
  }
}
