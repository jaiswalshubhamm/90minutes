import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/palette.dart';
import '../../../../providers/leagueProvider.dart';
import '../../../../models/standing.dart' as standing;
import '../../../../network/apiResponse.dart';
import '../../../../widgets/customText.dart';
import '../../../../widgets/loading.dart';
import 'all.dart';
import 'away.dart';
import 'home.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    var leagueDetailData = Provider.of<LeagueDetailsProvider>(context);
    List<standing.Response> _standing =
        leagueDetailData.standing.data?.response;
    if (leagueDetailData.standing.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (leagueDetailData.standing.status == NetworkStatus.COMPLETED) {
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
                height: 40,
              ),
              title: CustomText(
                text:
                    '${_standing[0].league.name},  ${_standing[0].league.country} ${_standing[0].league.season}',
                    size: 18
              ),
            ),
            Divider(
              color: Palette.darkerGrey,
            ),
            if (isSelected[0])
              AllStanding(standings: _standing[0].league.standings),
            if (isSelected[1])
              HomeStanding(standings: _standing[0].league.standings),
            if (isSelected[2])
              AwayStanding(standings: _standing[0].league.standings),
          ],
        ),
      );
    } else if (leagueDetailData.standing.status == NetworkStatus.ERROR) {
      return Text("Error : ${leagueDetailData.standing.message}");
    } else {
      return Text("${leagueDetailData.standing.message}");
    }
  }
}