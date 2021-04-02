import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/palette.dart';
import '../../../../providers/fixtureProvider.dart';
import '../../../../providers/authProvider.dart';
import '../../../../models/fixture.dart' as fixture;
import '../../../../network/apiResponse.dart';
import '../../../../widgets/customText.dart';
import '../../../../widgets/loading.dart';
import 'matchTile.dart';

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    List<fixture.Response> homeLast5 =
        fixtureDetailData.homeLast5?.data?.response;
    List<fixture.Response> awayLast5 =
        fixtureDetailData.awayLast5?.data?.response;
    List<fixture.Response> h2h = fixtureDetailData.h2h?.data?.response;
    if (fixtureDetailData.homeLast5?.status != NetworkStatus.COMPLETED ||
        fixtureDetailData.fixture.status != NetworkStatus.COMPLETED ||
        fixtureDetailData.awayLast5.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.homeLast5?.status == NetworkStatus.COMPLETED &&
        fixtureDetailData.awayLast5?.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Home',
                  color: Palette.primary,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            MatchTile(
              matches: homeLast5,
              authProvider: authProvider,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Away',
                  color: Palette.primary,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            MatchTile(
              matches: awayLast5,
              authProvider: authProvider,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'H2H',
                  color: Palette.primary,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            if (h2h != null)
              MatchTile(
                matches: h2h,
                authProvider: authProvider,
              ),
          ],
        ),
      );
    } else if (fixtureDetailData.homeLast5?.status == NetworkStatus.ERROR &&
        fixtureDetailData.awayLast5?.status == NetworkStatus.ERROR) {
      return Text("Error : ${fixtureDetailData.awayLast5.message}");
    } else {
      return Text("${fixtureDetailData.homeLast5.message}");
    }
  }
}
