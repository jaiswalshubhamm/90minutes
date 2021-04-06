import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/playerProvider.dart';
import '../../../models/players.dart' as player;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    var playerData = Provider.of<PlayerProvider>(context);
    List<player.Statistic> statistics =
        playerData.players?.data?.response[0].statistics;
    if (playerData.players?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (playerData.players?.status == NetworkStatus.COMPLETED) {
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
                  child: DropdownButton<int>(
                    value: i,
                    elevation: 25,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Palette.primary,
                      size: 32,
                    ),
                    items: statistics.map((map) {
                      return DropdownMenuItem<int>(
                        value: statistics.indexOf(map),
                        child: Row(
                          children: [
                            Image.network(
                              map.league.logo ??
                                  'https://media.api-sports.io/football/leagues/340.png',
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
                      text: '${statistics[0].league.name} ',
                      color: Palette.primary,
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    onChanged: (int value) {
                      setState(() {
                        i = value;
                      });
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
                        CustomText(text: 'Total Played'),
                        CustomText(text: '${statistics[i].games.appearences}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Lineups'),
                        CustomText(text: '${statistics[i].games.lineups}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Minutes'),
                        CustomText(text: '${statistics[i].games.minutes}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Position'),
                        CustomText(text: statistics[i].games.position)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Ratings'),
                        CustomText(
                          text: (statistics[i].games.rating != null)
                              ? statistics[i].games.rating.substring(0, 4)
                              : '',
                        ),
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
                      text: 'Subtitutes',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'In'),
                        CustomText(
                            text: '${statistics[i].substitutes.substitutesIn}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Out'),
                        CustomText(text: '${statistics[i].substitutes.out}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Bench'),
                        CustomText(text: '${statistics[i].substitutes.bench}')
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
                      text: 'Shots',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics[i].shots.total ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'On'),
                        CustomText(text: '${statistics[i].shots.on ?? ''}')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Goals',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics[i].goals.total ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Conceded'),
                        CustomText(
                            text: '${statistics[i].goals.conceded ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Assist'),
                        CustomText(text: '${statistics[i].goals.assists ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Saves'),
                        CustomText(text: '${statistics[i].goals.saves ?? ''}')
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
                      text: 'Passes',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics[i].passes.total ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Key'),
                        CustomText(text: '${statistics[i].passes.key ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Accuracy'),
                        CustomText(
                            text: '${statistics[i].passes.accuracy ?? ''}')
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
                      text: 'Tackles',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics[i].tackles.total ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Blocks'),
                        CustomText(
                            text: '${statistics[i].tackles.blocks ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Interceptions'),
                        CustomText(
                            text:
                                '${statistics[i].tackles.interceptions ?? ''}')
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
                      text: 'Duels',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total'),
                        CustomText(text: '${statistics[i].duels.total ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Won'),
                        CustomText(text: '${statistics[i].duels.won ?? ''}')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Dribles',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Attempts'),
                        CustomText(
                            text: '${statistics[i].dribbles.attempts ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Success'),
                        CustomText(
                            text: '${statistics[i].dribbles.success ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Past'),
                        CustomText(text: '${statistics[i].dribbles.past ?? ''}')
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
                      text: 'Foules',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Drawn'),
                        CustomText(text: '${statistics[i].fouls.drawn ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Commited'),
                        CustomText(
                            text: '${statistics[i].fouls.committed ?? ''}')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Cards',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Yellow'),
                        CustomText(text: '${statistics[i].cards.yellow ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Yellow Red'),
                        CustomText(
                            text: '${statistics[i].cards.yellowred ?? ''}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Red'),
                        CustomText(text: '${statistics[i].cards.red ?? ''}')
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
                      text: 'Penalty',
                      size: 20,
                      color: Palette.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Won'),
                        CustomText(text: '${statistics[i].penalty.won ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Comitted'),
                        CustomText(
                            text: '${statistics[i].penalty.commited ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Scored'),
                        CustomText(
                            text: '${statistics[i].penalty.scored ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Missed'),
                        CustomText(
                            text: '${statistics[i].penalty.missed ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Saved'),
                        CustomText(
                            text: '${statistics[i].penalty.saved ?? ''}'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (playerData.players?.status == NetworkStatus.ERROR) {
      return Text("Error : ${playerData.players.message}");
    } else {
      return Text("${playerData.players.message}");
    }
  }
}
