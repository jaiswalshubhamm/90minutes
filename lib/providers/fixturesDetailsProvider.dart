import 'package:flutter/foundation.dart';
import '../services/fixtures.dart';
import '../models/fixtures.dart';
import '../network/apiResponse.dart';

class FixturesDetailsProvider with ChangeNotifier {
  String _date;

  bool _live = false;

  int _id;

  Map<String, String> _params = {};

  FixturesService _fixturesService;

  ApiResponse<Fixtures> _fixture;

  ApiResponse<Fixtures> get fixtures => _fixture;

  void setDate(String date) {
    _date = date;
    _params = {"date": _date};
    fetchFixturesDetails();
    notifyListeners();
  }

  void setLive(bool live) {
    _live = live;
    if (_live) {
      _params = {"live": "all"};
    } else {
      _params = {"date": _date};
    }
    fetchFixturesDetails();
    notifyListeners();
  }

  void setId(int id) {
    _id = id;
    _params = {"id": '$_id'};
    fetchFixturesDetails();
    print('Hu');
    print('Hu');
    print('Hu');
    print('Hu');
    notifyListeners();
  }

  FixturesDetailsProvider() {
    _fixturesService = FixturesService();
    fetchFixturesDetails();
  }

  fetchFixturesDetails() async {
    if (_date == null) {
      DateTime currentDate = DateTime.now();
      String month = '${currentDate.month}';
      String day = '${currentDate.day}';
      if (month.length < 2) {
        month = '0$month';
      }
      if (day.length < 2) {
        month = '0$day';
      }
      _date = '${currentDate.year}-$month-$day';
      _params = {"date": _date};
    }
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
