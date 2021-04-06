import 'package:flutter/material.dart';
import '../../../../widgets/customText.dart';

class HomeStanding extends StatelessWidget {
  final List standings;

  HomeStanding({@required this.standings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        CustomText(
          text: standings[0].group,
          weight: FontWeight.w700,
        ),
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
                      ),
                      DataCell(Text('${team.home.played}')),
                      DataCell(Text('${team.home.win}')),
                      DataCell(Text('${team.home.draw}')),
                      DataCell(Text('${team.home.lose}')),
                      DataCell(
                        Text(
                            '${team.home.goals.against} : ${team.home.goals.goalsFor}'),
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
