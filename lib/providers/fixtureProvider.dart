import 'package:flutter/foundation.dart';
import '../models/fixtures.dart';
import '../services/fixtures.dart';
import '../network/apiResponse.dart';

class FixtureDetailsProvider with ChangeNotifier {
  int _id;

  Map<String, String> _params = {};

  FixturesService _fixturesService;

  ApiResponse<Fixtures> _fixture;

  ApiResponse<Fixtures> get fixtures => _fixture;

  void setId(int id) {
    _id = id;
    _params = {"id": '$_id'};
    fetchFixturesDetails();
    notifyListeners();
  }

  FixtureDetailsProvider() {
    _fixturesService = FixturesService();
  }

  fetchFixturesDetails() async {
    _fixture = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Fixtures fixtures = await _fixturesService.fetchFixtures(_params);
      _fixture = ApiResponse.completed(fixtures);
      notifyListeners();
    } catch (e) {
      _fixture = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
