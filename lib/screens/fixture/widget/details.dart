import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../models/fixtures.dart';
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatefulWidget {
  Details({Key key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    // var oddData = Provider.of<OddProvider>(context);
    List<Response> _fixture = fixtureDetailData.fixtures.data?.response;
    if (fixtureDetailData.fixtures.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.fixtures.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Image.network(
                  _fixture[0].league.logo ??
                      "https://media.api-sports.io/football/leagues/4.png",
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 10),
                CustomText(
                  text:
                      '${_fixture[0].league.country},  ${_fixture[0].league.name},  ${_fixture[0].league.round}',
                  size: 14,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                CustomText(
                  text:
                      '${_fixture[0].teams.home.name} - ${_fixture[0].teams.away.name}',
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  _fixture[0].teams.home.logo,
                  width: 100,
                ),
                CustomText(
                  text:
                      '${_fixture[0].score.fulltime.home ?? '-'}   --   ${_fixture[0].score.fulltime.away ?? '-'}',
                  size: 24,
                ),
                Image.network(
                  _fixture[0].teams.away.logo,
                  width: 100,
                ),
              ],
            ),
            Center(
              child: CustomText(text: 'Full Time', size: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  text:
                      'bet${_fixture[0].score.fulltime.home ?? '-'}   --   ${_fixture[0].score.fulltime.away ?? '-'}',
                  size: 24,
                ),
                CustomText(
                  text:
                      '${_fixture[0].score.fulltime.home ?? '-'}   --   ${_fixture[0].score.fulltime.away ?? '-'}',
                  size: 24,
                ),
                CustomText(
                  text:
                      '${_fixture[0].score.fulltime.home ?? '-'}   --   ${_fixture[0].score.fulltime.away ?? '-'}',
                  size: 24,
                ),
                CustomText(
                  text:
                      '${_fixture[0].score.fulltime.home ?? '-'}   --   ${_fixture[0].score.fulltime.away ?? '-'}',
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      );
    } else if (fixtureDetailData.fixtures.status == NetworkStatus.ERROR) {
      return Text("Error : ${fixtureDetailData.fixtures.message}");
    } else {
      return Text("${fixtureDetailData.fixtures.message}");
    }
  }
}
