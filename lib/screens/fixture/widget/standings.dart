import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../models/standing.dart' as standing;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/standings/all.dart';
import '../../../widgets/standings/away.dart';
import '../../../widgets/standings/home.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    List<standing.Response> _standing =
        fixtureDetailData.standing.data?.response;
    if (fixtureDetailData.standing.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.standing.status == NetworkStatus.COMPLETED) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 15),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Palette.darkerGrey,
                  borderRadius: BorderRadius.circular(26.0),
                ),
                child: ToggleButtons(
                  isSelected: isSelected,
                  selectedColor: Palette.primary,
                  fillColor: Palette.primary,
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(26),
                  selectedBorderColor: Palette.primary,
                  children: <Widget>[
                    Container(
                      width: (size.width - 90) / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            (isSelected[0]) ? Icons.check : Icons.clear,
                            size: 16.0,
                            color: Palette.white,
                          ),
                          SizedBox(width: 8),
                          CustomText(
                            text: "ALL",
                            color: Palette.white,
                            bgColor: (isSelected[0])
                                ? Palette.primary
                                : Palette.darkerGrey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: (size.width - 90) / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            (isSelected[1]) ? Icons.check : Icons.clear,
                            size: 16.0,
                            color: Palette.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            text: "HOME",
                            color: Palette.white,
                            bgColor: (isSelected[1])
                                ? Palette.primary
                                : Palette.darkerGrey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: (size.width - 90) / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            (isSelected[2]) ? Icons.check : Icons.clear,
                            size: 16.0,
                            color: Palette.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            text: "AWAY",
                            color: Palette.white,
                            bgColor: (isSelected[2])
                                ? Palette.primary
                                : Palette.darkerGrey,
                          ),
                        ],
                      ),
                    ),
                  ],
                  onPressed: (int newIndex) {
                    setState(
                      () {
                        for (int index = 0;
                            index < isSelected.length;
                            index++) {
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
              ),
              SizedBox(height: 8),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Image.network(
                  _standing[0].league.logo,
                  height: 30,
                ),
                title: CustomText(
                  text:
                      '${_standing[0].league.name},  ${_standing[0].league.country} ${_standing[0].league.season}',
                  size: 18,
                  weight: FontWeight.w700,
                ),
              ),
              Divider(
                color: Palette.darkerGrey,
                thickness: .5,
              ),
              if (isSelected[0])
                for (var group in _standing[0].league.standings)
                  AllStanding(standings: group),
              if (isSelected[1])
                for (var group in _standing[0].league.standings)
                  HomeStanding(standings: group),
              if (isSelected[2])
                for (var group in _standing[0].league.standings)
                  AwayStanding(standings: group),
            ],
          ),
        ),
      );
    } else if (fixtureDetailData.standing.status == NetworkStatus.ERROR) {
      return Text("Error : ${fixtureDetailData.standing.message}");
    } else {
      return Text("${fixtureDetailData.standing.message}");
    }
  }
}
