import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/models/leaugeModel.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:nintyminutesflutter/network/apiResponse.dart';
import 'package:nintyminutesflutter/providers/leagueDetailsProvider.dart';
import 'package:provider/provider.dart';

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
      return Center(child: CircularProgressIndicator());
    } else if (leaguesData.leagues.status == NetworkStatus.COMPLETED) {
      return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return ListTile(
            // leading: SvgPicture.network(
            //   _countries[i].flag ??
            //       'https:\/\/media.api-sports.io\/flags\/aw.svg',
            //   height: 15,
            //   width: 15,
            //   placeholderBuilder: (BuildContext context) => Container(
            //     child: const CircularProgressIndicator(),
            //   ),
            // ),
            title: Text(
              _leagues[i].league.name,
            ),
          );
        },
      );
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: ClipRRect(
      //     borderRadius:
      //         const BorderRadius.all(Radius.circular(25.0)),
      //     child: SvgPicture.network(
      //       item.flag ??
      //           'https:\/\/media.api-sports.io\/flags\/aw.svg',
      //       height: 15,
      //       width: 15,
      //       placeholderBuilder: (BuildContext context) =>
      //           Container(
      //         child: const CircularProgressIndicator(),
      //       ),
      //     ),
      //   ),
      // ),

    } else if (leaguesData.leagues.status == NetworkStatus.ERROR) {
      return Text("Error : ${leaguesData.leagues.message}");
    } else {
      return Text("${leaguesData.leagues.message}");
    }
  }
}
