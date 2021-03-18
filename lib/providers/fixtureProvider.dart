import 'package:flutter/foundation.dart';
import 'package:nintyminutesflutter/models/standing.dart';
import 'package:nintyminutesflutter/services/standing.dart';
import '../models/fixture.dart';
import '../services/fixture.dart';
import '../network/apiResponse.dart';

class FixtureDetailsProvider with ChangeNotifier {
  int tabControllerLength;
  bool isStanding;
  bool isLineup;
  int _id;

  Map<String, String> _params = {};

  FixtureService _fixtureService;

  StandingService _standingService;

  ApiResponse<FixtureModel> _fixture;

  ApiResponse<FixtureModel> get fixture => _fixture;

  ApiResponse<Standing> _standing;

  ApiResponse<Standing> get standing => _standing;

  FixtureDetailsProvider() {
    _fixtureService = FixtureService();
    _standingService = StandingService();
  }

  void call() async {
    tabControllerLength = 2;
    isStanding = false;
    isLineup = false;
    await fetchFixtureProvider();
    String league = '${_fixture.data?.response[0].league.id}';
    String season = '${_fixture.data?.response[0].league.season}';
    await fetchStanding(league, season);
    await checkLineup();
    await checkStanding();
    notifyListeners();
  }

  Future<void> checkStanding() async {
    if (_standing.data.response.length > 0) {
      tabControllerLength = tabControllerLength + 1;
      isStanding = true;
    }
  }

  Future<void> checkLineup() async {
    if (_fixture.data.response[0].lineups.length > 0) {
      tabControllerLength = tabControllerLength + 1;
      isLineup = true;
    }
  }

  void setId(int id) {
    _id = id;
    _params = {"id": '$_id'};
  }

  fetchFixtureProvider() async {
    _fixture = ApiResponse.loading('loading... ');
    try {
      FixtureModel fixture = await _fixtureService.fetchFixture(_params);
      _fixture = ApiResponse.completed(fixture);
    } catch (e) {
      _fixture = ApiResponse.error(e.toString());
    }
  }

  fetchStanding(String league, String season) async {
    Map<String, String> _standingParams = {"league": league, "season": season};
    _standing = ApiResponse.loading('loading... ');
    try {
      Standing standing = await _standingService.fetchStanding(_standingParams);
      _standing = ApiResponse.completed(standing);
      print(_standing);
    } catch (e) {
      _standing = ApiResponse.error(e.toString());
    }
  }
}
