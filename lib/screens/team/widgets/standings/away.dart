import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/teamProvider.dart';
import '../../../../widgets/customText.dart';

class AwayStanding extends StatelessWidget {
  final List standings;

  AwayStanding({@required this.standings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        CustomText(text: standings[0].group, weight: FontWeight.w700),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(label: Text('#')),
              DataColumn(label: Text('Team')),
              DataColumn(label: Text('P')),
              DataColumn(label: Text('W')),
              DataColumn(label: Text('D')),
              DataColumn(label: Text('L')),
              DataColumn(label: Text('GOALS')),
            ],
            rows: standings
                .map(
                  (team) => DataRow(
                    cells: [
                      DataCell(Text('${standings.indexOf(team) + 1}')),
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
                        onTap: () {
                          Provider.of<TeamProvider>(context, listen: false)
                              .setId(team.team.id);
                          Navigator.pushNamed(
                            context,
                            '/team',
                          );
                        },
                      ),
                      DataCell(Text('${team.away.played}')),
                      DataCell(Text('${team.away.win}')),
                      DataCell(Text('${team.away.draw}')),
                      DataCell(Text('${team.away.lose}')),
                      DataCell(Text(
                          '${team.away.goals.against} : ${team.away.goals.goalsFor}')),
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
