import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/leaugeModel.dart';
import '../../../network/apiResponse.dart';
import '../../../providers/leagueDetailsProvider.dart';
import '../../../widgets/loading.dart';

class Leagues extends StatefulWidget {
  Leagues({Key key}) : super(key: key);

  @override
  _LeaguesState createState() => _LeaguesState();
}

class _LeaguesState extends State<Leagues> {
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
          return Card(
            child: ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    _leagues[i].league.logo ??
                        "https://media.api-sports.io/football/leagues/4.png",
                    height: 25,
                    width: 25,
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
              title: Text(
                _leagues[i].league.name,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/leagues',
                  arguments: _leagues[i].league.id,
                );
              },
            ),
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
