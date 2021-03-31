import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/config/palette.dart';
import 'package:nintyminutesflutter/widgets/customText.dart';
import 'package:provider/provider.dart';
import '../../../providers/leagueDetailsProvider.dart';
import '../../../providers/leagueProvider.dart';
import '../../../models/leaugeModel.dart';
import '../../../network/apiResponse.dart';
import '../../../widgets/loading.dart';

class Leagues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var leaguesData = Provider.of<LeaguesDetailsProvider>(context);
    List<Response> _leagues = leaguesData.leagues.data?.response;

    if (leaguesData.leagues.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (leaguesData.leagues.status == NetworkStatus.COMPLETED) {
      return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                height: 50,
                child: ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        _leagues[i].league.logo ??
                            "https://media.api-sports.io/football/leagues/4.png",
                        height: 28,
                        width: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 0.8,
                      ),
                    ],
                  ),
                  title: CustomText(
                    text: _leagues[i].league.name,
                  ),
                  onTap: () {
                    Provider.of<LeagueDetailsProvider>(context, listen: false)
                        .setId(_leagues[i].league.id);
                    Navigator.pushNamed(
                      context,
                      '/leagues',
                    );
                  },
                ),
              ),
              SizedBox(height: 8),
              Divider(thickness: .6),
            ],
          );
        },
        itemCount: _leagues.length,
      );
    } else if (leaguesData.leagues.status == NetworkStatus.ERROR) {
      return Text("Error : ${leaguesData.leagues.message}");
    } else {
      return Text("${leaguesData.leagues.message}");
    }
  }
}
