import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/teamProvider.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../models/team.dart' as team;
import '../../../models/fixture.dart' as fixture;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var teamData = Provider.of<TeamProvider>(context);

    List<team.Response> _team = teamData.team.data?.response;
    List<fixture.Response> _featured = teamData.featured?.data?.response;
    if (teamData.team.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (teamData.team.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                Image.network(
                  _team[0].team.logo ??
                      "https://media.api-sports.io/football/leagues/4.png",
                  height: 80,
                  width: 60,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          '${_team[0].team.name},  ${_team[0].team.country}',
                      size: 20,
                      color: Palette.primary,
                    ),
                  ],
                ),
              ],
            ),

            // SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0),
            //   child: CustomText(
            //     text: 'Featured Match',
            //     size: 18,
            //     weight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 10),
            // if (_featured != null)
            //   ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   padding: EdgeInsets.all(14.0),
            //   itemBuilder: (context, i) {
            //     return GestureDetector(
            //       child: Card(
            //         color: Palette.lightGrey,
            //         child: Column(
            //           children: [
            //             ListTile(
            //               leading: Image.network(
            //                 _featured[i].league.logo ??
            //                     "https://media.api-sports.io/football/leagues/4.png",
            //                 height: 30,
            //                 width: 30,
            //               ),
            //               title: Row(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Row(
            //                         children: [
            //                           if (_league[0].country.flag != null)
            //                             SvgPicture.network(
            //                               _league[0].country.flag,
            //                               height: 10,
            //                             ),
            //                           SizedBox(width: 6),
            //                           CustomText(
            //                             text: _featured[i].league.country,
            //                             size: 12,
            //                             bgColor: Palette.lightGrey,
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: 3),
            //                       CustomText(
            //                         text: _featured[i].league.name,
            //                         weight: FontWeight.bold,
            //                         bgColor: Palette.lightGrey,
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Divider(
            //               color: Palette.darkerGrey,
            //               thickness: .5,
            //             ),
            //             ListTile(
            //               leading: Row(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   Center(
            //                     child: Text(
            //                       _featured[i].fixture.date.substring(11, 16),
            //                     ),
            //                   ),
            //                   VerticalDivider(
            //                     color: Palette.darkerGrey,
            //                     thickness: 1,
            //                   ),
            //                 ],
            //               ),
            //               title: Row(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   Column(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceEvenly,
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         _featured[i].teams.home.name,
            //                       ),
            //                       Text(
            //                         _featured[i].teams.away.name,
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               trailing: Row(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   Column(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceEvenly,
            //                     children: [
            //                       Text(
            //                         '${_featured[i].goals.home ?? ''}',
            //                       ),
            //                       Text(
            //                         '${_featured[i].goals.away ?? ''}',
            //                       ),
            //                     ],
            //                   ),
            //                   VerticalDivider(
            //                     color: Palette.darkerGrey,
            //                     thickness: 1,
            //                   ),
            //                   Icon(
            //                     Icons.notifications,
            //                     color: Palette.darkerGrey,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       onTap: () {
            //         Provider.of<FixtureDetailsProvider>(context,
            //                 listen: false)
            //             .setId(_featured[i].fixture.id);
            //         Provider.of<OddProvider>(context, listen: false)
            //             .setId(_featured[i].fixture.id);
            //         Navigator.pushNamed(
            //           context,
            //           '/fixture',
            //         );
            //       },
            //     );
            //   },
            //   itemCount: _featured?.length,
            // )
          ],
        ),
      );
    } else if (teamData.team.status == NetworkStatus.ERROR) {
      return Text("Error : ${teamData.team.message}");
    } else {
      return Text("${teamData.team.message}");
    }
  }
}
