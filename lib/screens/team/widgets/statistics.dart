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
  int valuee;
  @override
  Widget build(BuildContext context) {
    var teamData = Provider.of<TeamProvider>(context);
    stats.Response statistics = teamData.statistics?.data?.response;
    List<league.Response> leagues = teamData.league?.data?.response;
    if (teamData.statistics?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (teamData.statistics?.status == NetworkStatus.COMPLETED) {
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
                  value: valuee,
                  elevation: 25,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Palette.primary,
                    size: 32,
                  ),
                  items: leagues.map((map) {
                    return DropdownMenuItem<int>(
                      value: map.league.id,
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
                            size: 13,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  hint: CustomText(
                    text: '${leagues[0].league.name} ',
                    color: Palette.primary,
                    weight: FontWeight.w600,
                  ),
                  onChanged: (int value) {
                    setState(() {
                      valuee = value;
                    });
                    teamData.setLeague(value);
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 92,
              columns: <DataColumn>[
                DataColumn(
                    label: Text(
                  'Matches',
                  style: TextStyle(color: Palette.white),
                )),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total Played')),
                    DataCell(Text('${statistics.fixtures.played.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(Text('${statistics.fixtures.played.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(Text('${statistics.fixtures.played.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 64,
              columns: <DataColumn>[
                DataColumn(label: Text('Matches Wins')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total Played')),
                    DataCell(Text('${statistics.fixtures.wins.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(Text('${statistics.fixtures.wins.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(Text('${statistics.fixtures.wins.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 52,
              columns: <DataColumn>[
                DataColumn(label: Text('Matches Draws')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total Played')),
                    DataCell(Text('${statistics.fixtures.draws.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(Text('${statistics.fixtures.draws.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(Text('${statistics.fixtures.draws.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 56,
              columns: <DataColumn>[
                DataColumn(label: Text('Matches Loses')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total Played')),
                    DataCell(Text('${statistics.fixtures.loses.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(Text('${statistics.fixtures.loses.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(Text('${statistics.fixtures.loses.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 108,
              columns: <DataColumn>[
                DataColumn(label: Text('Goals For')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total')),
                    DataCell(
                        Text('${statistics.goals.goalsFor.total.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(
                        Text('${statistics.goals.goalsFor.total.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(
                        Text('${statistics.goals.goalsFor.total.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 50,
              columns: <DataColumn>[
                DataColumn(label: Text('Average Goals For')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total')),
                    DataCell(Text(
                        '${statistics.goals.goalsFor.average.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(
                        Text('${statistics.goals.goalsFor.average.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(
                        Text('${statistics.goals.goalsFor.average.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 80,
              columns: <DataColumn>[
                DataColumn(label: Text('Goals Against')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total')),
                    DataCell(
                        Text('${statistics.goals.against.total.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(
                        Text('${statistics.goals.against.total.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(
                        Text('${statistics.goals.against.total.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columns: <DataColumn>[
                DataColumn(label: Text('Average Goals Against')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total Played')),
                    DataCell(
                        Text('${statistics.goals.against.average.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(
                        Text('${statistics.goals.against.average.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(
                        Text('${statistics.goals.against.average.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 84,
              columns: <DataColumn>[
                DataColumn(label: Text('Bigest Streak')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Wins')),
                    DataCell(Text('${statistics.biggest.streak.wins ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Draws')),
                    DataCell(Text('${statistics.biggest.streak.draws ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Loses')),
                    DataCell(Text('${statistics.biggest.streak.loses ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 84,
              columns: <DataColumn>[
                DataColumn(label: Text('Biggest Wins')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(Text('${statistics.biggest.wins.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(Text('${statistics.biggest.wins.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 84,
              columns: <DataColumn>[
                DataColumn(label: Text('Biggest Loses')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(Text('${statistics.biggest.loses.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(Text('${statistics.biggest.loses.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 48,
              columns: <DataColumn>[
                DataColumn(label: Text('Biggest Goals For')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(
                        Text('${statistics.biggest.goals.goalsFor.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(
                        Text('${statistics.biggest.goals.goalsFor.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columns: <DataColumn>[
                DataColumn(label: Text('Biggest Goals Against')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(
                        Text('${statistics.biggest.goals.against.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(
                        Text('${statistics.biggest.goals.against.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 64,
              columns: <DataColumn>[
                DataColumn(label: Text('Clean Sheet')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total Played')),
                    DataCell(Text('${statistics.cleanSheet.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(Text('${statistics.cleanSheet.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(Text('${statistics.cleanSheet.away ?? ''}'))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            DataTable(
              dataRowHeight: 30,
              columnSpacing: 64,
              columns: <DataColumn>[
                DataColumn(label: Text('Failed To Score')),
                DataColumn(label: Text('')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(Text('Total Played')),
                    DataCell(Text('${statistics.failedToScore.total ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Home')),
                    DataCell(Text('${statistics.failedToScore.home ?? ''}'))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Away')),
                    DataCell(Text('${statistics.failedToScore.away ?? ''}'))
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } else if (teamData.statistics?.status == NetworkStatus.ERROR) {
      return Text("Error : ${teamData.statistics.message}");
    } else {
      return Text("${teamData.statistics.message}");
    }
  }
}
