import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/models/matches.dart';
import 'package:nintyminutesflutter/network/apiResponse.dart';
import 'package:nintyminutesflutter/providers/matchDetailsProvider.dart';
import 'package:provider/provider.dart';

class Matches extends StatefulWidget {
  Matches({Key key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    var matchesData = Provider.of<MatchesDetailsProvider>(context);
    List<Response> _matches = matchesData.matches.data?.response;

    if (matchesData.matches.status != NetworkStatus.COMPLETED) {
      return Center(child: CircularProgressIndicator());
    } else if (matchesData.matches.status == NetworkStatus.COMPLETED) {
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
              _matches[i].league.name,
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

    } else if (matchesData.matches.status == NetworkStatus.ERROR) {
      return Text("Error : ${matchesData.matches.message}");
    } else {
      return Text("${matchesData.matches.message}");
    }
  }
}
