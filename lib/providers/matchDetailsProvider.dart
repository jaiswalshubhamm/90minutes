import 'package:flutter/foundation.dart';
import 'package:nintyminutesflutter/models/matches.dart';
import 'package:nintyminutesflutter/network/apiResponse.dart';
import 'package:nintyminutesflutter/services/matches.dart';

class MatchesDetailsProvider with ChangeNotifier {
  String _date;

  // bool _live;

  MatchesService _matchesService;

  ApiResponse<Matches> _matches;

  ApiResponse<Matches> get matches => _matches;

  void setDate(String date) {
    _date = date;
    print(_date);
    fetchMatchesDetails();
    notifyListeners();
  }

  set setLive(bool live) {
    // _live = live;
    notifyListeners();
  }

  MatchesDetailsProvider() {
    _matchesService = MatchesService();
    fetchMatchesDetails();
  }

  fetchMatchesDetails() async {
    if (_date == null) {
      DateTime currentDate = DateTime.now();
      String month = '${currentDate.month}';
      if (month.length < 2) {
        month = '0$month';
        _date = '${currentDate.year}-$month-${currentDate.day}';
      } else {
        _date = '${currentDate.year}-${currentDate.month}-${currentDate.day}';
      }
    }
    Map<String, String> params = {
      "date": _date,
      // "live": ((_live != null) ? _live : "")
    };
    _matches = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Matches matches = await _matchesService.fetchMatches(params);
      _matches = ApiResponse.completed(matches);
      notifyListeners();
    } catch (e) {
      _matches = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
