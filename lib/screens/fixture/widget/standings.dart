import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/fixtureProvider.dart';
import '../../../models/standing.dart' as standing;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Standings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fixtureDetailData = Provider.of<FixtureDetailsProvider>(context);
    List<standing.Response> _standing = fixtureDetailData.standing.data?.response;
    if (fixtureDetailData.standing.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (fixtureDetailData.standing.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/footballField.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              _standing[0].league.standings[0].description,
              // 'Set Full Screen in Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.brown,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
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
