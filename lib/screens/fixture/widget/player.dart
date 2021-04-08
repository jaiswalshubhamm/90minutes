import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/playerProvider.dart';
import '../../../config/palette.dart';
import '../../../models/fixture.dart';
import '../../../widgets/customText.dart';

class Player extends StatelessWidget {
  final StartXiPlayer player;
  final int season;
  final String image;

  Player({@required this.player, this.season, this.image});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Provider.of<PlayerProvider>(context, listen: false)
              .setPlayerParams(player.id, '$season');
          Navigator.pushNamed(context, '/player');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: CustomText(
                      text: "${player.number}" ?? "1",
                      color: Palette.white,
                      size: 8,
                      bgColor: Palette.transparent,
                    ),
                  ),
                ),
                CustomText(
                  text: player.name ?? "Player ${player.id}",
                  weight: FontWeight.bold,
                  size: 10,
                  bgColor: Palette.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
