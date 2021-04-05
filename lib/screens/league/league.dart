import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/leagueProvider.dart';
import '../../config/palette.dart';
import '../../widgets/customText.dart';
import 'widget/details.dart';
import 'widget/standings/standings.dart';
import 'widget/topPlayer.dart';
import 'widget/matches.dart';

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
              appBar: AppBar(
                title: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Palette.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Palette.darkMode, width: .6),
                  ),
                  child: (leagueDetailData.league.data?.response != null)
                      ? DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Palette.lightGrey,
                            value: _year,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Palette.primary,
                            ),
                            iconSize: 24,
                            items: leagueDetailData
                                .league.data?.response[0].seasons
                                .map((map) {
                              return DropdownMenuItem<String>(
                                value: '${map.year}',
                                child: CustomText(
                                  text: '${map.year} ',
                                  color: Palette.primary,
                                  weight: FontWeight.w700,
                                  size: 20,
                                ),
                              );
                            }).toList(),
                            hint: CustomText(
                              text:
                                  '${leagueDetailData.league.data?.response[0].seasons.last.year}',
                              color: Palette.primary,
                              weight: FontWeight.w700,
                              size: 20,
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _year = value;
                              });
                              leagueDetailData.setYear(_year);
                            },
                          ),
                        )
                      : CustomText(
                          text: '2020',
                          color: Palette.primary,
                          size: 20,
                          weight: FontWeight.w700,
                        ),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  indicatorColor: Palette.white,
                  indicatorWeight: 4.0,
                  tabs: [
                    Tab(text: "DETAILS"),
                    if (leagueDetailData.isStanding) Tab(text: "STANDINGS"),
                    if (leagueDetailData.isTopPlayers) Tab(text: "TOP PLAYERS"),
                    Tab(text: "MATCHES"),
                  ],
                ),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TabBarView(
                  children: [
                    Details(),
                    if (leagueDetailData.isStanding) Standings(),
                    if (leagueDetailData.isTopPlayers) TopPlayer(),
                    Matches(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
