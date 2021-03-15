import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/network/apiResponse.dart';
import 'package:nintyminutesflutter/providers/countriesDetailsProvider.dart';
import 'package:provider/provider.dart';

class MyExpandableWidget extends StatelessWidget {
  // final League league;

  // MyExpandableWidget(this.league);

  @override
  Widget build(BuildContext context) {
    return Consumer<CountriesDetailsProvider>(
        builder: (context, myModel, child) {
      if (myModel.countries.status == NetworkStatus.COMPLETED) {
        return Text("${myModel.countries.data.response}");
      } else if (myModel.countries.status == NetworkStatus.ERROR) {
        return Text("Error : ${myModel.countries.message}");
      } else {
        return Text("${myModel.countries.message}");
      }
    });
  }
}

// Widget build(BuildContext context) {
//   return ExpansionTile(
//       title: Text(
//         "league.leagueName",
//         style: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//           color: Colors.pinkAccent,
//         ),
//       ),
//       children: [
//         Text(
//           "league.leagueName",
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             color: Colors.pinkAccent,
//           ),
//         ),
//         Text(
//           "league.leagueName",
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             color: Colors.pinkAccent,
//           ),
//         )
//       ]);
// }
// }
