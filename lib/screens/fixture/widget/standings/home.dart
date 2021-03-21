import 'package:flutter/material.dart';
import '../../../../config/palette.dart';
import '../../../../widgets/customText.dart';

class HomeStanding extends StatelessWidget {
  final List standings;

  HomeStanding({@required this.standings});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
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
                    CustomText(text: '${standings.indexOf(team)}'),
                  ),
                  DataCell(
                    Row(
                      children: [
                        Image.network(
                          team.team.logo,
                          height: 40,
                        ),
                        SizedBox(width: 10),
                        Text(team.team.name),
                      ],
                    ),
                  ),
                  DataCell(
                    Text('${team.home.played}'),
                  ),
                  DataCell(
                    Text('${team.home.win}'),
                  ),
                  DataCell(
                    Text('${team.home.draw}'),
                  ),
                  DataCell(
                    Text('${team.home.lose}'),
                  ),
                  DataCell(
                    Text(
                        '${team.home.goals.against} : ${team.home.goals.forr}'),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
