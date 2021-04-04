import 'package:flutter/foundation.dart';
import '../models/team.dart' as teamModel;
import '../models/fixture.dart' as fixtures;
import '../models/league.dart' as leagues;
import '../models/statistics.dart';
import '../models/standing.dart';
import '../services/team.dart';
import '../services/fixture.dart';
import '../services/league.dart';
import '../services/statistics.dart';
import '../services/standing.dart';
import '../network/apiResponse.dart';

class TeamProvider with ChangeNotifier {
  int tabControllerLength;
  bool isStanding;
  bool isStatistics;
  int _id;

  Map<String, String> _params = {};

  Map<String, String> _statisticsParams = {};

  TeamService _teamService;

  FixtureService _fixtureService;

  LeagueService _leagueService;

  StandingService _standingService;

  StatisticsService _statisticsService;

  ApiResponse<teamModel.Team> _team;

  ApiResponse<teamModel.Team> get team => _team;

  ApiResponse<fixtures.FixtureModel> _last10;

  ApiResponse<fixtures.FixtureModel> get last10 => _last10;

  ApiResponse<fixtures.FixtureModel> _featured;

  ApiResponse<fixtures.FixtureModel> get featured => _featured;

  ApiResponse<leagues.LeagueModel> _league;

  ApiResponse<leagues.LeagueModel> get league => _league;

  ApiResponse<Standing> _standing;

  ApiResponse<Standing> get standing => _standing;

  ApiResponse<Statistics> _statistics;

  ApiResponse<Statistics> get statistics => _statistics;

  TeamProvider() {
    _teamService = TeamService();
    _fixtureService = FixtureService();
    _leagueService = LeagueService();
    _standingService = StandingService();
    _statisticsService = StatisticsService();
  }

  void call() async {
    tabControllerLength = 2;
    isStanding = false;
    isStatistics = false;
    await fetchTeam();
    notifyListeners();
    await fetchLast10();
    notifyListeners();
    await fetchFeatured();
    notifyListeners();
    await fetchLeagues();
    notifyListeners();
    await fetchStanding();
    await checkStanding();
    notifyListeners();
    _statisticsParams = {
      "team": '${_team.data.response[0].team.id}',
      "league": '${_league.data.response[0].league.id}',
      "season": '${_league.data.response[0].seasons.last.year}'
    };
    await fetchStatistics();
    await checkStatistics();
    notifyListeners();
  }

  Future<void> checkStanding() async {
    if (_standing.data.response.length > 0) {
      tabControllerLength = tabControllerLength + 1;
      isStanding = true;
    }
  }

  Future<void> checkStatistics() async {
    if (_statistics.data.response != null) {
      tabControllerLength = tabControllerLength + 1;
      isStatistics = true;
    }
  }

  void setId(int id) {
    _id = id;
    _params = {"id": '$_id'};
  }

  void setLeague(int id) async {
    _statisticsParams = {
      "team": '${_team.data.response[0].team.id}',
      "league": '$id',
      "season": '${_league.data.response[0].seasons.last.year}'
    };
    await fetchStatistics();
    notifyListeners();
  }

  fetchTeam() async {
    _team = ApiResponse.loading('loading... ');
    try {
      teamModel.Team team = await _teamService.fetchTeam(_params);
      _team = ApiResponse.completed(team);
    } catch (e) {
      _team = ApiResponse.error(e.toString());
    }
  }

  fetchLast10() async {
    Map<String, String> _last10Params = {
      "team": '${_team.data?.response[0].team.id}',
      "last": '10'
    };
    _last10 = ApiResponse.loading('loading... ');
    try {
      fixtures.FixtureModel fixture =
          await _fixtureService.fetchFixture(_last10Params);
      _last10 = ApiResponse.completed(fixture);
    } catch (e) {
      _last10 = ApiResponse.error(e.toString());
    }
  }

  fetchFeatured() async {
    Map<String, String> _featuredParams = {
      "team": '${_team.data?.response[0].team.id}',
      "next": '5'
    };
    _featured = ApiResponse.loading('loading... ');
    try {
      fixtures.FixtureModel fixture =
          await _fixtureService.fetchFixture(_featuredParams);
      _featured = ApiResponse.completed(fixture);
    } catch (e) {
      _featured = ApiResponse.error(e.toString());
    }
  }

  fetchLeagues() async {
    Map<String, String> _leagueParams = {
      "team": '${_team.data?.response[0].team.id}'
    };
    _league = ApiResponse.loading('loading... ');
    try {
      leagues.LeagueModel league =
          await _leagueService.fetchLeague(_leagueParams);
      _league = ApiResponse.completed(league);
    } catch (e) {
      _league = ApiResponse.error(e.toString());
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

  fetchStatistics() async {
    _statistics = ApiResponse.loading('loading... ');
    try {
      Statistics statistics =
          await _statisticsService.fetchStatistics(_statisticsParams);
      _statistics = ApiResponse.completed(statistics);
    } catch (e) {
      _statistics = ApiResponse.error(e.toString());
    }
  }
}
