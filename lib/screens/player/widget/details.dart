import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/playerProvider.dart';
import '../../../models/players.dart' as player;
import '../../../models/transfer.dart' as transfer;
import '../../../models/fixture.dart' as fixture;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var playerData = Provider.of<PlayerProvider>(context);

    List<player.Response> _player = playerData.players.data?.response;
    List<transfer.Response> _transfer = playerData.transfers?.data?.response;
    if (playerData.players.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (playerData.players.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: Palette.darkerGrey,
              thickness: .5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Image.network(
                  _player[0].statistics[0].team.logo,
                  height: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                CustomText(
                  text: '${_player[0].statistics[0].team.name}',
                  size: 20,
                ),
              ],
            ),
            Divider(
              color: Palette.darkerGrey,
              thickness: .5,
            ),
            Container(
              color: Palette.darkerGrey,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              if (_player[0].statistics[0].league.flag != null)
                                SvgPicture.network(
                                  _player[0].statistics[0].league.flag,
                                  height: 16,
                                ),
                              CustomText(
                                text:
                                    '${_player[0].statistics[0].league.country}',
                                size: 18,
                                bgColor: Palette.darkerGrey,
                              ),
                            ],
                          ),
                          CustomText(
                            text: 'Nationality',
                            size: 14,
                            color: Palette.lightGrey,
                            bgColor: Palette.darkerGrey,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: '${_player[0].player.age}',
                                size: 20,
                                bgColor: Palette.darkerGrey,
                              ),
                              CustomText(
                                text: 'YRS',
                                size: 14,
                                bgColor: Palette.darkerGrey,
                              ),
                            ],
                          ),
                          CustomText(
                            text: '${_player[0].player.birth.date}',
                            size: 14,
                            color: Palette.lightGrey,
                            bgColor: Palette.darkerGrey,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: '${_player[0].player.birth.place}',
                            size: 14,
                            bgColor: Palette.darkerGrey,
                          ),
                          CustomText(
                            text: 'Birth Place',
                            size: 14,
                            color: Palette.lightGrey,
                            bgColor: Palette.darkerGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: _player[0].player.height,
                            size: 18,
                            bgColor: Palette.darkerGrey,
                          ),
                          CustomText(
                            text: 'Height',
                            size: 14,
                            color: Palette.lightGrey,
                            bgColor: Palette.darkerGrey,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: _player[0].player.weight,
                            size: 20,
                            bgColor: Palette.darkerGrey,
                          ),
                          CustomText(
                            text: 'Weight',
                            size: 14,
                            color: Palette.lightGrey,
                            bgColor: Palette.darkerGrey,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: _player[0].statistics[0].games.position,
                            size: 20,
                            bgColor: Palette.darkerGrey,
                          ),
                          CustomText(
                            text: 'Position',
                            size: 14,
                            color: Palette.lightGrey,
                            bgColor: Palette.darkerGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomText(
              text: 'Transfers',
              size: 20,
              bgColor: Palette.darkerGrey,
            ),
            if (_transfer != null)
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(14.0),
                itemBuilder: (context, i) {
                  return Card(
                    color: Palette.lightGrey,
                    child: ListTile(
                      leading: Image.network(
                        _transfer[0].transfers[i].teams.teamsIn.logo ??
                            "https://media.api-sports.io/football/leagues/4.png",
                        height: 30,
                        width: 30,
                      ),
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: _transfer[0]
                                        .transfers[i]
                                        .teams
                                        .teamsIn
                                        .name,
                                    size: 12,
                                    bgColor: Palette.lightGrey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),
                              CustomText(
                                text: _transfer[0]
                                    .transfers[i]
                                    .teams
                                    .teamsIn
                                    .name,
                                weight: FontWeight.bold,
                                bgColor: Palette.lightGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: CustomText(
                        text: _transfer[0].transfers[i].type,
                        weight: FontWeight.bold,
                        bgColor: Palette.lightGrey,
                      ),
                    ),
                  );
                },
                itemCount: _transfer?.length,
              )
          ],
        ),
      );
    } else if (playerData.players.status == NetworkStatus.ERROR) {
      return Text("Error : ${playerData.players.message}");
    } else {
      return Text("${playerData.players.message}");
    }
  }
}
