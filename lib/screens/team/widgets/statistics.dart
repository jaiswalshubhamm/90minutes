import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/teamProvider.dart';
import '../../../models/statistics.dart';
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    var teamData = Provider.of<TeamProvider>(context);
    Response statistics = teamData.statistics?.data?.response;
    if (teamData.statistics?.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (teamData.last10?.status == NetworkStatus.COMPLETED) {
      return CustomText(
        text: 'hi',
        size: 12,
      );
    } else if (teamData.last10?.status == NetworkStatus.ERROR) {
      return Text("Error : ${teamData.last10.message}");
    } else {
      return Text("${teamData.last10.message}");
    }
  }
}
