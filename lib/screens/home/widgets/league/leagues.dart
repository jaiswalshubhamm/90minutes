import 'package:flutter/material.dart';
import '../../../../config/palette.dart';
import '../../../../widgets/customText.dart';
import 'topLeague.dart';
import 'allLeagues.dart';

class Leagues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CustomText(
              text: 'Top Leagues',
              size: 20,
              color: Palette.primary,
              weight: FontWeight.bold,
            ),
          ),
          TopLeagues(),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CustomText(
              text: 'All Leagues',
              size: 20,
              color: Palette.primary,
              weight: FontWeight.bold,
            ),
          ),
          AllLeagues()
        ],
      ),
    );
  }
}
