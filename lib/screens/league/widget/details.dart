import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/leagueProvider.dart';
import '../../../models/league.dart' as league;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var leagueDetailData = Provider.of<LeagueDetailsProvider>(context);

    List<league.Response> _league = leagueDetailData.league.data?.response;
    if (leagueDetailData.league.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (leagueDetailData.league.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Image.network(
                  _league[0].league.logo ??
                      "https://media.api-sports.io/football/leagues/4.png",
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 10),
                CustomText(
                  text: '${_league[0].league.type},  ${_league[0].league.name}',
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      );
    } else if (leagueDetailData.league.status == NetworkStatus.ERROR) {
      return Text("Error : ${leagueDetailData.league.message}");
    } else {
      return Text("${leagueDetailData.league.message}");
    }
  }
}
