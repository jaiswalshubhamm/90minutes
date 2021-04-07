import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/teamProvider.dart';
import '../../config/palette.dart';
import '../../widgets/customText.dart';

class AllStanding extends StatelessWidget {
  final List standings;

  AllStanding({@required this.standings});

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
              DataColumn(label: Text('LAST 5')),
              DataColumn(label: Text('PTS')),
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
                      DataCell(Text('${team.all.played}')),
                      DataCell(Text('${team.all.win}')),
                      DataCell(Text('${team.all.draw}')),
                      DataCell(Text('${team.all.lose}')),
                      DataCell(
                        Text(
                            '${team.all.goals.against} : ${team.all.goals.goalsFor}'),
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
                                            : (team.form.substring(i, i + 1) ==
                                                    'L')
                                                ? Palette.lose
                                                : Palette.primary,
                                        child: Center(
                                          child: CustomText(
                                            text: team.form.substring(i, i + 1),
                                            color: Palette.white,
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
