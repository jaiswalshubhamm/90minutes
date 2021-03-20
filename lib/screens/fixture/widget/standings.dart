import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../models/standing.dart' as standing;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    List<standing.Response> _standing =
        fixtureDetailData.standing.data?.response;
    if (fixtureDetailData.standing.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.standing.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ToggleButtons(
              isSelected: isSelected,
              selectedColor: Palette.primary,
              fillColor: Palette.secondary,
              color: Palette.black,
              selectedBorderColor: Palette.primary,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: CustomText(
                    text: 'All',
                    size: 18,
                    bgColor: Palette.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: CustomText(
                    text: 'Home',
                    size: 18,
                    bgColor: Palette.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: CustomText(
                    text: 'Away',
                    size: 18,
                    bgColor: Palette.transparent,
                  ),
                ),
              ],
              onPressed: (int newIndex) {
                setState(
                  () {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == newIndex) {
                        isSelected[index] = true;
                      } else {
                        isSelected[index] = false;
                      }
                    }
                  },
                );
              },
            ),
            ListTile(
              leading: Image.network(
                _standing[0].league.logo,
                height: 30,
                width: 30,
              ),
              title: CustomText(
                text:
                    '${_standing[0].league.name},  ${_standing[0].league.country}',
              ),
            ),
            Divider(
              color: Palette.darkerGrey,
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
                rows: _standing[0]
                    .league
                    .standings
                    .map(
                      (team) => DataRow(
                        cells: [
                          DataCell(
                            CustomText(
                                text:
                                    '${_standing[0].league.standings.indexOf(team)}'),
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
                            Text(
                                '${team.all.goals.against} : ${team.all.goals.forr}'),
                          ),
                          (team.form != null)
                              ? DataCell(
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor: (team.form
                                                    .substring(0, 1) ==
                                                'D')
                                            ? Palette.darkerGrey
                                            : (team.form.substring(0, 1) == 'L')
                                                ? Palette.lose
                                                : Palette.primary,
                                        child: Center(
                                          child: Text(
                                            team.form.substring(0, 1),
                                            style:
                                                TextStyle(color: Palette.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor: (team.form
                                                    .substring(1, 2) ==
                                                'D')
                                            ? Palette.darkerGrey
                                            : (team.form.substring(1, 2) == 'L')
                                                ? Palette.lose
                                                : Palette.primary,
                                        child: Center(
                                          child: Text(
                                            team.form.substring(1, 2),
                                            style:
                                                TextStyle(color: Palette.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor: (team.form
                                                    .substring(2, 3) ==
                                                'D')
                                            ? Palette.darkerGrey
                                            : (team.form.substring(2, 3) == 'L')
                                                ? Palette.lose
                                                : Palette.primary,
                                        child: Center(
                                          child: Text(
                                            team.form.substring(2, 3),
                                            style:
                                                TextStyle(color: Palette.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor: (team.form
                                                    .substring(3, 4) ==
                                                'D')
                                            ? Palette.darkerGrey
                                            : (team.form.substring(3, 4) == 'L')
                                                ? Palette.lose
                                                : Palette.primary,
                                        child: Center(
                                          child: Text(
                                            team.form.substring(3, 4),
                                            style:
                                                TextStyle(color: Palette.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor: (team.form
                                                    .substring(4, 5) ==
                                                'D')
                                            ? Palette.darkerGrey
                                            : (team.form.substring(4, 5) == 'L')
                                                ? Palette.lose
                                                : Palette.primary,
                                        child: Center(
                                          child: Text(
                                            team.form.substring(4, 5),
                                            style:
                                                TextStyle(color: Palette.white),
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
            ),
          ],
        ),
      );
    } else if (fixtureDetailData.standing.status == NetworkStatus.ERROR) {
      return Text("Error : ${fixtureDetailData.standing.message}");
    } else {
      return Text("${fixtureDetailData.standing.message}");
    }
  }
}
