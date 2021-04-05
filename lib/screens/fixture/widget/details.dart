import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/teamProvider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../providers/oddProvider.dart';
import '../../../models/fixture.dart' as fixture;
import '../../../models/odd.dart' as odd;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    var oddData = Provider.of<OddProvider>(context);

    List<fixture.Response> _fixture = fixtureDetailData.fixture.data?.response;
    List<odd.Response> _odd = oddData.odd.data?.response;
    if (fixtureDetailData.fixture.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.fixture.status == NetworkStatus.COMPLETED &&
        oddData.odd.status == NetworkStatus.COMPLETED) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  Image.network(
                    _fixture[0].league.logo ??
                        "https://media.api-sports.io/football/leagues/4.png",
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    child: CustomText(
                      text:
                          '${_fixture[0].league.country},  ${_fixture[0].league.name},  ${_fixture[0].league.round}',
                      size: 15,
                      // weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              CustomText(
                text:
                    '${_fixture[0].teams.home.name} - ${_fixture[0].teams.away.name}',
                size: 20,
                weight: FontWeight.w700,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Image.network(
                      _fixture[0].teams.home.logo,
                      width: 80,
                    ),
                    onTap: () {
                      Provider.of<TeamProvider>(context, listen: false)
                          .setId(_fixture[0].teams.home.id);
                      Navigator.pushNamed(
                        context,
                        '/team',
                      );
                    },
                  ),
                  CustomText(
                    text:
                        '${_fixture[0].score.fulltime.home ?? '-'}   -   ${_fixture[0].score.fulltime.away ?? '-'}',
                    size: 24,
                  ),
                  GestureDetector(
                    child: Image.network(
                      _fixture[0].teams.away.logo,
                      width: 80,
                    ),
                    onTap: () {
                      Provider.of<TeamProvider>(context, listen: false)
                          .setId(_fixture[0].teams.away.id);
                      Navigator.pushNamed(
                        context,
                        '/team',
                      );
                    },
                  ),
                ],
              ),
              Center(
                child: CustomText(text: 'Full Time', size: 10),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Palette.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: CustomText(
                        text: 'bet365',
                        size: 16,
                        bgColor: Palette.primary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      color: Palette.darkerGrey,
                      child: CustomText(
                        text: (_odd.length != 0)
                            ? _odd[0].bookmakers[0].bets[0].values[0].odd
                            : '--',
                        size: 20,
                        bgColor: Palette.darkerGrey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      color: Palette.darkerGrey,
                      child: CustomText(
                        text: (_odd.length != 0)
                            ? _odd[0].bookmakers[0].bets[0].values[1].odd
                            : '--',
                        size: 20,
                        bgColor: Palette.darkerGrey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Palette.darkerGrey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: CustomText(
                        text: (_odd.length != 0)
                            ? _odd[0].bookmakers[0].bets[0].values[2].odd
                            : '--',
                        size: 20,
                        bgColor: Palette.darkerGrey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Venue',
                    size: 20,
                    weight: FontWeight.bold,
                    color: Palette.primary,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Name ',
                        size: 16,
                      ),
                      CustomText(
                        text: _fixture[0].fixture.venue.name,
                        size: 13,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Location ',
                        size: 16,
                      ),
                      CustomText(
                        text: _fixture[0].fixture.venue.city,
                        size: 13,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Image.network((_fixture[0].fixture.venue.id != null)
                      ? 'https://media.api-sports.io/football/venues/${_fixture[0].fixture.venue.id}.png'
                      : 'https://media.api-sports.io/football/leagues/304.png'),
                ],
              ),
            ],
          ),
        ),
      );
    } else if (fixtureDetailData.fixture.status == NetworkStatus.ERROR) {
      return Text("Error : ${fixtureDetailData.fixture.message}");
    } else {
      return Text("${fixtureDetailData.fixture.message}");
    }
  }
}
