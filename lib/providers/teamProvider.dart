import 'package:flutter/foundation.dart';
import '../models/team.dart' as teamModel;
import '../models/fixture.dart' as fixture;
import '../models/league.dart';
import '../models/standing.dart';
import '../services/team.dart';
import '../services/fixture.dart';
import 'package:nintyminutesflutter/services/league.dart';
import 'package:nintyminutesflutter/services/standing.dart';
import '../network/apiResponse.dart';

class TeamProvider with ChangeNotifier {
  int tabControllerLength;
  bool isStanding;
  int _id;

  Map<String, String> _params = {};

  TeamService _teamService;

  FixtureService _fixtureService;

  LeagueService _leagueService;

  StandingService _standingService;

  ApiResponse<teamModel.Team> _team;

  ApiResponse<teamModel.Team> get team => _team;

  ApiResponse<fixture.FixtureModel> _featured;

  ApiResponse<fixture.FixtureModel> get featured => _featured;

  ApiResponse<LeagueModel> _league;

  ApiResponse<LeagueModel> get league => _league;

  ApiResponse<Standing> _standing;

  ApiResponse<Standing> get standing => _standing;

  ApiResponse<fixture.FixtureModel> _last10;

  ApiResponse<fixture.FixtureModel> get last10 => _last10;

  TeamProvider() {
    _teamService = TeamService();
  }

  void call() async {
    tabControllerLength = 1;
    isStanding = false;
    await fetchTeam();
    // await fetchFeatured();
    // notifyListeners();
    // await fetchStanding();
    // await checkStanding();
    // notifyListeners();
    // await fetchTopPlayers();
    // await checkTopPlayers();
    // notifyListeners();
    // await fetchLast10();
    // notifyListeners();
  }

  Future<void> checkStanding() async {
    if (_standing.data.response.length > 0) {
      tabControllerLength = tabControllerLength + 1;
      isStanding = true;
    }
  }

  // Future<void> checkTopPlayers() async {
  //   if (_players.data.response.length > 0) {
  //     tabControllerLength = tabControllerLength + 1;
  //     isTopPlayers = true;
  //   }
  // }

  void setId(int id) {
    _id = id;
    _params = {"id": '$_id'};
  }

  fetchTeam() async {
    _team = ApiResponse.loading('loading... ');
    try {
      teamModel.Team team = await _teamService.fetchTeam(_params);
      _team = ApiResponse.completed(team);
      print(_team.status);
    } catch (e) {
      _team = ApiResponse.error(e.toString());
    }
  }

  fetchStanding() async {
    Map<String, String> _standingParams = {
      "league": '${_league.data.response[0].league.id}',
      "season": '${_league.data.response[0].seasons.last.year}'
    };
    _standing = ApiResponse.loading('loading... ');
    try {
      Standing standing = await _standingService.fetchStanding(_standingParams);
      _standing = ApiResponse.completed(standing);
    } catch (e) {
      _standing = ApiResponse.error(e.toString());
    }
  }
}
