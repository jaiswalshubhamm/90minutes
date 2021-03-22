import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/leagueProvider.dart';
import '../../config/palette.dart';
import '../../widgets/customText.dart';
import 'widget/details.dart';
import 'widget/standings/standings.dart';
import 'widget/topPlayer.dart';
import 'package:nintyminutesflutter/screens/home/widgets/favorites.dart';

class LeagueScreen extends StatefulWidget {
  final int id;
  const LeagueScreen({Key key, this.id}) : super(key: key);
  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  String _year;
  @override
  void initState() {
    super.initState();
    Provider.of<LeagueDetailsProvider>(context, listen: false).call();
  }

  @override
  Widget build(BuildContext context) {
    var leagueDetailData = Provider.of<LeagueDetailsProvider>(context);
    return Container(
      child: Consumer<LeagueDetailsProvider>(
        builder: (context, person, child) {
          return DefaultTabController(
            length: leagueDetailData.tabControllerLength,
            child: Scaffold(
              backgroundColor: Palette.white,
              appBar: AppBar(
                title: (leagueDetailData.league.data?.response != null)
                    ? Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Palette.primary,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            iconEnabledColor: Colors.black,
                            value: _year,
                            elevation: 5,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Palette.white,
                            ),
                            iconSize: 20,
                            items: leagueDetailData
                                .league.data?.response[0].seasons
                                .map((map) {
                              return DropdownMenuItem<String>(
                                value: '${map.year}',
                                child: Container(
                                  color: Palette.white,
                                  child: CustomText(
                                    text: '${map.year} ',
                                    color: Palette.white,
                                    size: 20,
                                    bgColor: Palette.primary,
                                  ),
                                ),
                              );
                            }).toList(),
                            hint: CustomText(
                              text:
                                  '${leagueDetailData.league.data?.response[0].seasons.last.year} ',
                              bgColor: Palette.primary,
                              color: Palette.white,
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _year = value;
                              });
                              leagueDetailData.setYear(_year);
                            },
                          ),
                        ),
                      )
                    : Text('2020'),
                backgroundColor: Palette.primary,
                elevation: 20.0,
                bottom: TabBar(
                  indicatorColor: Palette.primary,
                  isScrollable: true,
                  tabs: [
                    Tab(text: "DETAILS"),
                    if (leagueDetailData.isStanding) Tab(text: "STANDINGS"),
                    if (leagueDetailData.isTopPlayers) Tab(text: "TOP PLAYERS"),
                    Tab(text: "MATCHES"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Details(),
                  if (leagueDetailData.isStanding) Standings(),
                  if (leagueDetailData.isTopPlayers) TopPlayer(),
                  favorites(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
