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
    Size screenSize = MediaQuery.of(context).size;
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    List<standing.Response> _standing =
        fixtureDetailData.standing.data?.response;
    if (fixtureDetailData.standing.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.standing.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
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
                      text: 'DIFF',
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
                            Text('${team.goalsDiff}'),
                          ),
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
