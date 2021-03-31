import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/teamProvider.dart';
import '../../../models/statistics.dart';
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    var teamData = Provider.of<TeamProvider>(context);
    Response statistics = teamData.statistics?.data?.response;
    if (teamData.statistics?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (teamData.last10?.status == NetworkStatus.COMPLETED) {
      return

          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
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
          // );

          CustomText(
        text: 'hi',
        size: 12,
      );
    } else if (teamData.last10?.status == NetworkStatus.ERROR) {
      return Text("Error : ${teamData.last10.message}");
    } else {
      return Text("${teamData.last10.message}");
    }
  }
}
