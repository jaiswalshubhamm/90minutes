import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/playerProvider.dart';
import '../../../models/players.dart' as player;
import '../../../models/transfer.dart' as transfer;
import '../../../models/trophies.dart' as trophies;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var playerData = Provider.of<PlayerProvider>(context);
    List<player.Response> _player = playerData.players.data?.response;
    List<transfer.Response> _transfer = playerData.transfers?.data?.response;
    List<trophies.Response> _trophies = playerData.trophies?.data?.response;
    if (playerData.players.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (playerData.players.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Divider(
              color: Palette.darkerGrey,
              thickness: .5,
            ),
            ListTile(
              dense: true,
              leading: Image.network(
                _player[0].statistics[0].team.logo,
                height: 30,
              ),
              title: CustomText(
                text: '${_player[0].statistics[0].team.name}',
                size: 20,
              ),
            ),
            Divider(
              color: Palette.darkerGrey,
              thickness: .5,
            ),
            SizedBox(height: 10),
            Container(
              height: 180,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 3),
                elevation: 1,
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
                                if (_player[0].statistics[0].league.flag !=
                                    null)
                                  SvgPicture.network(
                                    _player[0].statistics[0].league.flag,
                                    height: 16,
                                  ),
                                CustomText(
                                  text:
                                      '${_player[0].statistics[0].league.country}',
                                  size: 18,
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            CustomText(
                              text: 'Nationality',
                              size: 14,
                              color: Palette.darkerGrey,
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
                                ),
                                CustomText(
                                  text: 'YRS',
                                  size: 14,
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            CustomText(
                              text: '${_player[0].player.birth.date}'
                                  .substring(0, 10),
                              size: 14,
                              color: Palette.darkerGrey,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: '${_player[0].player.birth.place}',
                              size: 14,
                            ),
                            SizedBox(height: 3),
                            CustomText(
                              text: 'Birth Place',
                              size: 14,
                              color: Palette.darkerGrey,
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
                            ),
                            SizedBox(height: 3),
                            CustomText(
                              text: 'Height',
                              size: 14,
                              color: Palette.darkerGrey,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: _player[0].player.weight,
                              size: 20,
                            ),
                            SizedBox(height: 3),
                            CustomText(
                              text: 'Weight',
                              size: 14,
                              color: Palette.darkerGrey,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: _player[0].statistics[0].games.position,
                              size: 20,
                            ),
                            SizedBox(height: 3),
                            CustomText(
                              text: 'Position',
                              size: 14,
                              color: Palette.darkerGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            CustomText(
              text: 'Transfers',
              size: 20,
              weight: FontWeight.w600,
              color: Palette.primary,
            ),
            if (_transfer != null)
              if (_transfer.length > 0)
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 4),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          _transfer[0].transfers[i].teams.teamsIn.logo ??
                              "https://media.api-sports.io/football/leagues/4.png",
                          height: 30,
                          width: 30,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  '${_transfer[0].transfers[i].teams.out.name}-${_transfer[0].transfers[i].teams.teamsIn.name}',
                              weight: FontWeight.bold,
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${_transfer[0].transfers[i].date}'
                                  .substring(0, 10),
                            ),
                          ],
                        ),
                        trailing: CustomText(
                          text: _transfer[0].transfers[i].type,
                          weight: FontWeight.bold,
                          color: Palette.primary,
                        ),
                      ),
                    );
                  },
                  itemCount: _transfer[0].transfers.length,
                ),
            SizedBox(height: 10),
            CustomText(
              text: 'Trophies',
              size: 20,
              weight: FontWeight.w600,
              color: Palette.primary,
            ),
            SizedBox(height: 8),
            if (_trophies != null)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  dataRowHeight: 40,
                  columns: <DataColumn>[
                    DataColumn(label: Text('#')),
                    DataColumn(label: Text('Country')),
                    DataColumn(label: Text('League')),
                    DataColumn(label: Text('Season')),
                    DataColumn(label: Text('Place')),
                  ],
                  rows: _trophies
                      .map(
                        (trophy) => DataRow(
                          cells: [
                            DataCell(Text('${_trophies.indexOf(trophy) + 1}')),
                            DataCell(Text(trophy.league)),
                            DataCell(Text(trophy.country)),
                            DataCell(Text(trophy.season)),
                            DataCell(Text(trophy.place)),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
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
