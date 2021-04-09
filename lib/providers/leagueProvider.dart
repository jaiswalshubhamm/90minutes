import 'package:flutter/foundation.dart';
import '../models/league.dart';
import '../models/standing.dart';
import '../models/players.dart';
import '../models/fixture.dart';
import '../services/league.dart';
import '../services/standing.dart';
import '../services/topScorers.dart';
import '../services/fixture.dart';
import '../network/apiResponse.dart';

class LeagueDetailsProvider with ChangeNotifier {
  int tabControllerLength;
  bool isStanding;
  bool isTopPlayers;
  int _id;
  String _year;
  List<String> already = [];

  Map<String, String> _params = {};

  LeagueService _leagueService;

  StandingService _standingService;

  TopScorersService _topScorersService;

  FixtureService _fixtureService;

  ApiResponse<LeagueModel> _league;

  ApiResponse<LeagueModel> get league => _league;

  ApiResponse<Standing> _standing;

  ApiResponse<Standing> get standing => _standing;

  ApiResponse<Players> _players;

  ApiResponse<Players> get players => _players;

  ApiResponse<FixtureModel> _last10;

  ApiResponse<FixtureModel> get last10 => _last10;

  ApiResponse<FixtureModel> _featured;

  ApiResponse<FixtureModel> get featured => _featured;

  LeagueDetailsProvider() {
    _leagueService = LeagueService();
    _standingService = StandingService();
    _topScorersService = TopScorersService();
    _fixtureService = FixtureService();
  }

  void call() async {
    already = [];
    tabControllerLength = 2;
    isStanding = false;
    isTopPlayers = false;
    await fetchLeague();
    if (_year == null) {
      _year = '${_league.data?.response[0].seasons.last.year}';
    }
    notifyListeners();
    await fetchFeatured();
    notifyListeners();
    await fetchStanding();
    await checkStanding();
    notifyListeners();
    await fetchTopPlayers();
    await checkTopPlayers();
    notifyListeners();
    await fetchLast10();
    notifyListeners();
  }

  Future<void> checkStanding() async {
    if (_standing.data.response.length > 0) {
      if (!already.contains("standing")) {
        already.add("standing");
        tabControllerLength = tabControllerLength + 1;
      }
      isStanding = true;
    }
  }

  Future<void> checkTopPlayers() async {
    if (_players.data.response.length > 0) {
      if (!already.contains("topPlayer")) {
        already.add("topPlayer");
        tabControllerLength = tabControllerLength + 1;
      }
      isTopPlayers = true;
    }
  }

  void setId(int id) {
    _id = id;
    _params = {"id": '$_id'};
  }

  void setYear(String year) async {
    tabControllerLength = 2;
    isStanding = false;
    isTopPlayers = false;
    _year = year;
    _params = {"league": '$_id', 'season': _year};
    fetchFeatured();
    notifyListeners();
    await fetchStanding();
    await checkStanding();
    notifyListeners();
    await fetchTopPlayers();
    await checkTopPlayers();
    notifyListeners();
    await fetchLast10();
    notifyListeners();
  }

  fetchLeague() async {
    _league = ApiResponse.loading('loading... ');
    try {
      LeagueModel league = await _leagueService.fetchLeague(_params);
      _league = ApiResponse.completed(league);
    } catch (e) {
      _league = ApiResponse.error(e.toString());
    }
  }

  fetchStanding() async {
    Map<String, String> _standingParams = {
      "league": '$_id',
      "season": '$_year'
    };
    _standing = ApiResponse.loading('loading... ');
    try {
      Standing standing = await _standingService.fetchStanding(_standingParams);
      _standing = ApiResponse.completed(standing);
    } catch (e) {
      _standing = ApiResponse.error(e.toString());
    }
  }

  fetchTopPlayers() async {
    Map<String, String> _topPlayersParams = {
      "league": '$_id',
      "season": '$_year'
    };
    _players = ApiResponse.loading('loading... ');
    try {
      Players players =
          await _topScorersService.fetchTopScorers(_topPlayersParams);
      _players = ApiResponse.completed(players);
    } catch (e) {
      _players = ApiResponse.error(e.toString());
    }
  }

  fetchLast10() async {
    Map<String, String> _last10Params = {
      'league': '$_id',
      'season': '$_year',
      'last': '10',
    };
    _last10 = ApiResponse.loading('loading... ');
    try {
      FixtureModel fixture = await _fixtureService.fetchFixture(_last10Params);
      _last10 = ApiResponse.completed(fixture);
    } catch (e) {
      _last10 = ApiResponse.error(e.toString());
    }
  }

  fetchFeatured() async {
    Map<String, String> _featuredParams = {
      'league': '$_id',
      'season': '$_year',
      'last': '5',
    };
    _featured = ApiResponse.loading('loading... ');
    try {
      FixtureModel fixture =
          await _fixtureService.fetchFixture(_featuredParams);
      _featured = ApiResponse.completed(fixture);
    } catch (e) {
      _featured = ApiResponse.error(e.toString());
    }
  }
}
