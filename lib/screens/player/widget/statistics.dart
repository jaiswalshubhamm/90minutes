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
    List<player.Response> _player = playerData.players.data?.response;
    if (playerData.players?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (playerData.players?.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Palette.primary, width: 1.4),
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
                  items: _player[0].statistics.map((map) {
                    return DropdownMenuItem<int>(
                      value: _player[0].statistics.indexOf(map),
                      child: Row(
                        children: [
                          Image.network(
                            map.league.logo ??
                                'https://media.api-sports.io/football/leagues/340.png',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          CustomText(
                            text: '${map.league.name} ',
                            color: Palette.primary,
                            weight: FontWeight.w700,
                            size: 14,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  hint: CustomText(
                    text: '${_player[0].statistics[0].league.name} ',
                    color: Palette.primary,
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
            SizedBox(height: 10),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 64,
              columns: <DataColumn>[
                DataColumn(label: Text('Matches')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total Played')),
                    DataCell(Text(
                        '${_player[0].statistics[i].games.appearences ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Lineups')),
                    DataCell(
                        Text('${_player[0].statistics[i].games.lineups ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Minutes')),
                    DataCell(
                        Text('${_player[0].statistics[i].games.minutes ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Position')),
                    DataCell(
                        Text(_player[0].statistics[i].games.position ?? ''))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Ratings')),
                    DataCell(
                      Text((_player[0].statistics[i].games.rating != null)
                          ? _player[0]
                              .statistics[i]
                              .games
                              .rating
                              .substring(0, 4)
                          : ''),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columns: <DataColumn>[
                DataColumn(label: Text('Subtitutes')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('In')),
                    DataCell(Text(
                        '${_player[0].statistics[i].substitutes.substitutesIn ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Out')),
                    DataCell(Text(
                        '${_player[0].statistics[i].substitutes.out ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Bench')),
                    DataCell(Text(
                        '${_player[0].statistics[i].substitutes.bench ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 60,
              columns: <DataColumn>[
                DataColumn(label: Text('Shots')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total')),
                    DataCell(
                        Text('${_player[0].statistics[i].shots.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('On')),
                    DataCell(Text('${_player[0].statistics[i].shots.on ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 44,
              columns: <DataColumn>[
                DataColumn(label: Text('Goals')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total')),
                    DataCell(
                        Text('${_player[0].statistics[i].goals.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Conceded')),
                    DataCell(Text(
                        '${_player[0].statistics[i].goals.conceded ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Assist')),
                    DataCell(
                        Text('${_player[0].statistics[i].goals.assists ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Saves')),
                    DataCell(
                        Text('${_player[0].statistics[i].goals.saves ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 52,
              columns: <DataColumn>[
                DataColumn(label: Text('Passes')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total')),
                    DataCell(
                        Text('${_player[0].statistics[i].passes.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Key')),
                    DataCell(
                        Text('${_player[0].statistics[i].passes.key ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Accuracy')),
                    DataCell(Text(
                        '${_player[0].statistics[i].passes.accuracy ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columns: <DataColumn>[
                DataColumn(label: Text('Tackles')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total')),
                    DataCell(
                        Text('${_player[0].statistics[i].tackles.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Blocks')),
                    DataCell(Text(
                        '${_player[0].statistics[i].tackles.blocks ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Interceptions')),
                    DataCell(Text(
                        '${_player[0].statistics[i].tackles.interceptions ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 70,
              columns: <DataColumn>[
                DataColumn(label: Text('Duels')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total')),
                    DataCell(
                        Text('${_player[0].statistics[i].duels.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Won')),
                    DataCell(
                        Text('${_player[0].statistics[i].duels.won ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 44,
              columns: <DataColumn>[
                DataColumn(label: Text('Dribbles')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Attempts')),
                    DataCell(Text(
                        '${_player[0].statistics[i].dribbles.attempts ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Success')),
                    DataCell(Text(
                        '${_player[0].statistics[i].dribbles.success ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Past')),
                    DataCell(
                        Text('${_player[0].statistics[i].dribbles.past ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 44,
              columns: <DataColumn>[
                DataColumn(label: Text('Fouls')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Drawn')),
                    DataCell(
                        Text('${_player[0].statistics[i].fouls.drawn ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Committed')),
                    DataCell(Text(
                        '${_player[0].statistics[i].fouls.committed ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 44,
              columns: <DataColumn>[
                DataColumn(label: Text('Cards')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Yellow')),
                    DataCell(
                        Text('${_player[0].statistics[i].cards.yellow ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Yellow Red')),
                    DataCell(Text(
                        '${_player[0].statistics[i].cards.yellowred ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Red')),
                    DataCell(
                        Text('${_player[0].statistics[i].cards.red ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 44,
              columns: <DataColumn>[
                DataColumn(label: Text('Penalty')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Won')),
                    DataCell(
                        Text('${_player[0].statistics[i].penalty.won ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Commited')),
                    DataCell(Text(
                        '${_player[0].statistics[i].penalty.commited ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Scored')),
                    DataCell(Text(
                        '${_player[0].statistics[i].penalty.scored ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Missed')),
                    DataCell(Text(
                        '${_player[0].statistics[i].penalty.missed ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Saved')),
                    DataCell(
                        Text('${_player[0].statistics[i].penalty.saved ?? ''}'))
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } else if (playerData.players?.status == NetworkStatus.ERROR) {
      return Text("Error : ${playerData.players.message}");
    } else {
      return Text("${playerData.players.message}");
    }
  }
}
