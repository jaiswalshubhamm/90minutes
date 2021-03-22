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
    var leagueDetailData = Provider.of<LeagueDetailsProvider>(context);

    List<league.Response> _league = leagueDetailData.league.data?.response;
    if (leagueDetailData.league.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (leagueDetailData.league.status == NetworkStatus.COMPLETED) {
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
                  _league[0].league.logo ??
                      "https://media.api-sports.io/football/leagues/4.png",
                  height: 80,
                  width: 60,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          '${_league[0].league.type},  ${_league[0].league.name}',
                      size: 20,
                      color: Palette.primary,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.network(
                          _league[0].league.logo ??
                              "https://media.api-sports.io/football/leagues/4.png",
                          height: 40,
                          width: 60,
                        ),
                        CustomText(
                          text: '${_league[0].country.name}',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CustomText(
                text: 'Featured Match',
                size: 18,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                Image.network(
                  _league[0].league.logo ??
                      "https://media.api-sports.io/football/leagues/4.png",
                  height: 80,
                  width: 60,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          '${_league[0].league.type},  ${_league[0].league.name}',
                      size: 20,
                      color: Palette.primary,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.network(
                          _league[0].league.logo ??
                              "https://media.api-sports.io/football/leagues/4.png",
                          height: 40,
                          width: 60,
                        ),
                        CustomText(
                          text: '${_league[0].country.name}',
                        ),
                      ],
                    ),
                  ],
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
