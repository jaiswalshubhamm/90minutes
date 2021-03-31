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
  String valuee;
  @override
  Widget build(BuildContext context) {
    var teamData = Provider.of<TeamProvider>(context);
    stats.Response statistics = teamData.statistics?.data?.response;
    List<league.Response> leagues = teamData.league?.data?.response;
    if (teamData.statistics?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (teamData.last10?.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Palette.primary),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: valuee,
                  elevation: 25,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Palette.primary,
                    size: 32,
                  ),
                  items: leagues.map((map) {
                    return DropdownMenuItem<String>(
                      value: '${map.league.name}',
                      child: Row(
                        children: [
                          Image.network(
                            map.league.logo,
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: '${map.league.name} ',
                            color: Palette.primary,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String value) {
                    setState(() {
                      valuee = value;
                    });
                    // leagueDetailData.setYear(_year);
                  },
                ),
              ),
            ),
            
          ],
        ),
        //   child: DataTable(
        //     columnSpacing: 15,
        //     columns: <DataColumn>[
        //       DataColumn(
        //         label: CustomText(
        //           text: '#',
        //           color: Palette.primary,
        //         ),
        //       ),
        //       DataColumn(
        //         label: CustomText(
        //           text: 'Team',
        //           color: Palette.primary,
        //         ),
        //       ),
        //       DataColumn(
        //         label: CustomText(
        //           text: 'P',
        //           color: Palette.primary,
        //         ),
        //       ),
        //       DataColumn(
        //         label: CustomText(
        //           text: 'W',
        //           color: Palette.primary,
        //         ),
        //       ),
        //       DataColumn(
        //         label: CustomText(
        //           text: 'D',
        //           color: Palette.primary,
        //         ),
        //       ),
        //       DataColumn(
        //         label: CustomText(
        //           text: 'L',
        //           color: Palette.primary,
        //         ),
        //       ),
        //       DataColumn(
        //         label: CustomText(
        //           text: 'GOALS',
        //           color: Palette.primary,
        //         ),
        //       ),
        //     ],
        //     rows: standings
        //         .map(
        //           (team) => DataRow(
        //             cells: [
        //               DataCell(
        //                 CustomText(text: '${standings.indexOf(team)}'),
        //               ),
        //               DataCell(
        //                 Row(
        //                   children: [
        //                     Image.network(
        //                       team.team.logo,
        //                       height: 40,
        //                     ),
        //                     SizedBox(width: 10),
        //                     Text(team.team.name),
        //                   ],
        //                 ),
        //               ),
        //               DataCell(
        //                 Text('${team.away.played}'),
        //               ),
        //               DataCell(
        //                 Text('${team.away.win}'),
        //               ),
        //               DataCell(
        //                 Text('${team.away.draw}'),
        //               ),
        //               DataCell(
        //                 Text('${team.away.lose}'),
        //               ),
        //               DataCell(
        //                 Text(
        //                     '${team.away.goals.against} : ${team.away.goals.goalsFor}'),
        //               ),
        //             ],
        //           ),
        //         )
        //         .toList(),
        //   ),
      );

      //     CustomText(
      //   text: 'hi',
      //   size: 12,
      // );
    } else if (teamData.last10?.status == NetworkStatus.ERROR) {
      return Text("Error : ${teamData.last10.message}");
    } else {
      return Text("${teamData.last10.message}");
    }
  }
}
