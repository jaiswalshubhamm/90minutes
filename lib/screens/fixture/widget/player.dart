import 'package:flutter/material.dart';
import '../../../config/palette.dart';
import '../../../widgets/customText.dart';

class Player extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final int number;

  Player({@required this.id, this.name, this.image, this.number});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          print("player id is $id");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
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
                      text: "$number" ?? "1",
                      color: Palette.white,
                      size: 8,
                      bgColor: Palette.transparent,
                    ),
                  ),
                ),
                CustomText(
                  text: name ?? "Player $id",
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
