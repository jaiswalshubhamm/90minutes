import 'package:flutter/foundation.dart';
import '../services/matches.dart';
import '../models/matches.dart';
import '../network/apiResponse.dart';

class MatchesDetailsProvider with ChangeNotifier {
  String _date;

  bool _live = false;

  Map<String, String> _params = {};

  MatchesService _matchesService;

  ApiResponse<Matches> _matches;

  ApiResponse<Matches> get matches => _matches;

  void setDate(String date) {
    _date = date;
    fetchMatchesDetails();
    notifyListeners();
  }

  void setLive(bool live) {
    _live = live;
    fetchMatchesDetails();
    notifyListeners();
  }

  MatchesDetailsProvider() {
    _matchesService = MatchesService();
    fetchMatchesDetails();
  }

  fetchMatchesDetails() async {
    if (_live) {
      _params = {"live": "all"};
    } else {
      if (_date == null) {
        DateTime currentDate = DateTime.now();
        String month = '${currentDate.month}';
        if (month.length < 2) {
          month = '0$month';
          _date = '${currentDate.year}-$month-${currentDate.day}';
        } else {
          _date = '${currentDate.year}-${currentDate.month}-${currentDate.day}';
        }
        _params = {"date": _date};
      }
    }
    _matches = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Matches matches = await _matchesService.fetchMatches(_params);
      _matches = ApiResponse.completed(matches);
      notifyListeners();
    } catch (e) {
      _matches = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
