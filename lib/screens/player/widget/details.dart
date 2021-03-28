import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/palette.dart';
import '../../../providers/playerProvider.dart';
import '../../../models/players.dart' as player;
import '../../../models/fixture.dart' as fixture;
import '../../../network/apiResponse.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/loading.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var playerData = Provider.of<PlayerProvider>(context);

    List<player.Response> _player = playerData.players.data?.response;
    // List<fixture.Response> _featured =
    //     leagueDetailData.featured?.data?.response;
    if (playerData.players.status != NetworkStatus.COMPLETED) {
      return Center(child: Loading());
    } else if (playerData.players.status == NetworkStatus.COMPLETED) {
      return SingleChildScrollView(
        child: CustomText(
          text: '${_player[0].player.name}',
          size: 20,
          color: Palette.primary,
        ),
      );
    } else if (playerData.players.status == NetworkStatus.ERROR) {
      return Text("Error : ${playerData.players.message}");
    } else {
      return Text("${playerData.players.message}");
    }
  }
}
