import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/widgets/expandableWidget.dart';

Widget leagues() {
  return Container(child: MyExpandableWidget());
  //  FutureBuilder(
  //   future: SoccerApi().getAllMatches(),
  //   builder: (context, snapshot) {
  //     if (snapshot.hasData) {
  //       print((snapshot.data).length);
  //       return PageBody(snapshot.data);
  //     } else {
  //       return Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     }
  //   },
  // );
}
