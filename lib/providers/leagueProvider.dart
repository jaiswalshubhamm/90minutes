import 'package:flutter/foundation.dart';
import '../models/league.dart';
import '../services/league.dart';
import '../network/apiResponse.dart';

class LeagueDetailsProvider with ChangeNotifier {
  int tabControllerLength;
  bool isStanding;
  bool isTopPlayers;
  int _id;

  Map<String, String> _params = {};

  LeagueService _leagueService;

  ApiResponse<LeagueModel> _league;

  ApiResponse<LeagueModel> get league => _league;

  LeagueDetailsProvider() {
    _leagueService = LeagueService();
  }

  void call() async {
    tabControllerLength = 2;
    isStanding = false;
    isTopPlayers = false;
    await fetchLeagueProvider();
    // await fetchStanding();
    // await checkStanding();
    // await checkTopPlayers();
    notifyListeners();
  }

  // Future<void> checkStanding() async {
  //   if (_standing.data.response.length > 0) {
  //     tabControllerLength = tabControllerLength + 1;
  //     isStanding = true;
  //   }
  // }

  // Future<void> checkLineup() async {
  //   if (_fixture.data.response[0].lineups.length > 0) {
  //     tabControllerLength = tabControllerLength + 1;
  //     isLineup = true;
  //   }
  // }

  void setId(int id) {
    _id = id;
    _params = {"id": '$_id'};
  }

  fetchLeagueProvider() async {
    _league = ApiResponse.loading('loading... ');
    try {
      LeagueModel league = await _leagueService.fetchLeague(_params);
      _league = ApiResponse.completed(league);
    } catch (e) {
      _league = ApiResponse.error(e.toString());
    }
  }
}
