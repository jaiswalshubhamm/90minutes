import 'package:flutter/material.dart';
import '../../../../config/palette.dart';
import '../../../../widgets/customText.dart';

class AwayStanding extends StatelessWidget {
  final List standings;

  AwayStanding({@required this.standings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        CustomText(
          text: standings[0].group,
          weight: FontWeight.w700,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                label: CustomText(
                  text: '#',
                  color: Palette.primary,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: 'Team',
                  color: Palette.primary,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: 'P',
                  color: Palette.primary,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: 'W',
                  color: Palette.primary,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: 'D',
                  color: Palette.primary,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: 'L',
                  color: Palette.primary,
                ),
              ),
              DataColumn(
                label: CustomText(
                  text: 'GOALS',
                  color: Palette.primary,
                ),
              ),
            ],
            rows: standings
                .map(
                  (team) => DataRow(
                    cells: [
                      DataCell(
                        CustomText(text: '${standings.indexOf(team) + 1}'),
                      ),
                      DataCell(
                        Row(
                          children: [
                            Image.network(
                              team.team.logo,
                              height: 30,
                            ),
                            SizedBox(width: 20),
                            Text(team.team.name),
                          ],
                        ),
                      ),
                      DataCell(
                        Text('${team.away.played}'),
                      ),
                      DataCell(
                        Text('${team.away.win}'),
                      ),
                      DataCell(
                        Text('${team.away.draw}'),
                      ),
                      DataCell(
                        Text('${team.away.lose}'),
                      ),
                      DataCell(
                        Text(
                            '${team.away.goals.against} : ${team.away.goals.goalsFor}'),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
