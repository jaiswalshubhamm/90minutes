import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/teamProvider.dart';
import '../../../models/league.dart' as league;
import '../../../models/statistics.dart' as stats;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  String valuee;
  @override
  Widget build(BuildContext context) {
    var teamData = Provider.of<TeamProvider>(context);
    stats.Response statistics = teamData.statistics?.data?.response;
    List<league.Response> leagues = teamData.league?.data?.response;
    if (teamData.statistics?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (teamData.statistics?.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Palette.primary),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: valuee,
                    elevation: 25,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Palette.primary,
                      size: 32,
                    ),
                    items: leagues.map((map) {
                      return DropdownMenuItem<String>(
                        value: '${map.league.name}',
                        child: Row(
                          children: [
                            Image.network(
                              map.league.logo,
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: '${map.league.name} ',
                              color: Palette.primary,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    hint: CustomText(
                      text: '${leagues[0].league.name} ',
                      color: Palette.primary,
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    onChanged: (String value) {
                      setState(() {
                        valuee = value;
                      });
                      // leagueDetailData.setYear(_year);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Matches',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics.fixtures.played.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(text: '${statistics.fixtures.played.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(text: '${statistics.fixtures.played.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Matches Wins',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics.fixtures.wins.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(text: '${statistics.fixtures.wins.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(text: '${statistics.fixtures.wins.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Matches Draws',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics.fixtures.draws.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(text: '${statistics.fixtures.draws.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(text: '${statistics.fixtures.draws.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Matches Loses',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics.fixtures.loses.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(text: '${statistics.fixtures.loses.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(text: '${statistics.fixtures.loses.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Goals For',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(
                            text: '${statistics.goals.goalsFor.total.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(
                            text: '${statistics.goals.goalsFor.total.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(
                            text: '${statistics.goals.goalsFor.total.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Average Goals For',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(
                            text: '${statistics.goals.goalsFor.average.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(
                            text: '${statistics.goals.goalsFor.average.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(
                            text: '${statistics.goals.goalsFor.average.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Goals Against',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(
                            text: '${statistics.goals.against.total.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(
                            text: '${statistics.goals.against.total.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(
                            text: '${statistics.goals.against.total.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Average Goals Against',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(
                            text: '${statistics.goals.against.average.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(
                            text: '${statistics.goals.against.average.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(
                            text: '${statistics.goals.against.average.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Biggest Streak',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Wins'),
                        CustomText(text: '${statistics.biggest.streak.wins}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Draws'),
                        CustomText(text: '${statistics.biggest.streak.draws}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Loses'),
                        CustomText(text: '${statistics.biggest.streak.loses}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Biggest Wins',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(text: statistics.biggest.wins.home),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(text: statistics.biggest.wins.away),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Biggest Loses',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(text: statistics.biggest.loses.home),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(text: statistics.biggest.loses.away),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Biggest Goals For',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(
                            text: '${statistics.biggest.goals.goalsFor.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(
                            text: '${statistics.biggest.goals.goalsFor.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Biggest Goals Against',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(
                            text: '${statistics.biggest.goals.against.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(
                            text: '${statistics.biggest.goals.against.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Clean Sheet',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics.cleanSheet.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(text: '${statistics.cleanSheet.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(text: '${statistics.cleanSheet.away}')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Failed To Score',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics.failedToScore.total}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Home'),
                        CustomText(text: '${statistics.failedToScore.home}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Away'),
                        CustomText(text: '${statistics.failedToScore.away}')
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (teamData.statistics?.status == NetworkStatus.ERROR) {
      return Text("Error : ${teamData.statistics.message}");
    } else {
      return Text("${teamData.statistics.message}");
    }
  }
}
