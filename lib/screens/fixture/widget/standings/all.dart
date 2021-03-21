import 'package:flutter/material.dart';
import '../../../../config/palette.dart';
import '../../../../widgets/customText.dart';

class AllStanding extends StatelessWidget {
  final List standings;

  AllStanding({@required this.standings});

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
          DataColumn(
            label: CustomText(
              text: 'LAST 5',
              color: Palette.primary,
            ),
          ),
          DataColumn(
            label: CustomText(
              text: 'PTS',
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
                        SizedBox(width: 20),
                        Text(team.team.name),
                      ],
                    ),
                  ),
                  DataCell(
                    Text('${team.all.played}'),
                  ),
                  DataCell(
                    Text('${team.all.win}'),
                  ),
                  DataCell(
                    Text('${team.all.draw}'),
                  ),
                  DataCell(
                    Text('${team.all.lose}'),
                  ),
                  DataCell(
                    Text('${team.all.goals.against} : ${team.all.goals.forr}'),
                  ),
                  (team.form != null)
                      ? DataCell(
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    (team.form.substring(0, 1) == 'D')
                                        ? Palette.darkerGrey
                                        : (team.form.substring(0, 1) == 'L')
                                            ? Palette.lose
                                            : Palette.primary,
                                child: Center(
                                  child: Text(
                                    team.form.substring(0, 1),
                                    style: TextStyle(color: Palette.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    (team.form.substring(1, 2) == 'D')
                                        ? Palette.darkerGrey
                                        : (team.form.substring(1, 2) == 'L')
                                            ? Palette.lose
                                            : Palette.primary,
                                child: Center(
                                  child: Text(
                                    team.form.substring(1, 2),
                                    style: TextStyle(color: Palette.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    (team.form.substring(2, 3) == 'D')
                                        ? Palette.darkerGrey
                                        : (team.form.substring(2, 3) == 'L')
                                            ? Palette.lose
                                            : Palette.primary,
                                child: Center(
                                  child: Text(
                                    team.form.substring(2, 3),
                                    style: TextStyle(color: Palette.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    (team.form.substring(3, 4) == 'D')
                                        ? Palette.darkerGrey
                                        : (team.form.substring(3, 4) == 'L')
                                            ? Palette.lose
                                            : Palette.primary,
                                child: Center(
                                  child: Text(
                                    team.form.substring(3, 4),
                                    style: TextStyle(color: Palette.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    (team.form.substring(4, 5) == 'D')
                                        ? Palette.darkerGrey
                                        : (team.form.substring(4, 5) == 'L')
                                            ? Palette.lose
                                            : Palette.primary,
                                child: Center(
                                  child: Text(
                                    team.form.substring(4, 5),
                                    style: TextStyle(color: Palette.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : DataCell(Text('Not')),
                  DataCell(
                    Text('${team.points}'),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
