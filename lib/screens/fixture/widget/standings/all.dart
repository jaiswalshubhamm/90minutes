import 'package:flutter/material.dart';
import '../../../../config/palette.dart';
import '../../../../widgets/customText.dart';

class AllStanding extends StatelessWidget {
  final List standings;

  AllStanding({@required this.standings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: CustomText(
            text: standings[0].group,
            weight: FontWeight.w700,
          ),
        ),
        SingleChildScrollView(
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
                              height: 30,
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
                        Text('${team.all.goals.against} : ${team.all.goals.goalsFor}'),
                      ),
                      (team.form != null)
                          ? DataCell(
                              Container(
                                width: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: (team.form
                                                    .substring(i, i + 1) ==
                                                'D')
                                            ? Palette.darkerGrey
                                            : (team.form.substring(i, i + 1) == 'L')
                                                ? Palette.lose
                                                : Palette.primary,
                                        child: Center(
                                          child: Text(
                                            team.form.substring(i, i + 1),
                                            style: TextStyle(color: Palette.white),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: team.form.length,
                                ),
                              ),
                            )
                          : DataCell(Text('Not Found')),
                      DataCell(
                        Text('${team.points}'),
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