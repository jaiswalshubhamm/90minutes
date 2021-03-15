import 'package:flutter/foundation.dart';
import 'package:nintyminutesflutter/models/matches.dart';
import 'package:nintyminutesflutter/network/apiResponse.dart';
import 'package:nintyminutesflutter/services/matches.dart';

class MatchesDetailsProvider with ChangeNotifier {
  MatchesService _matchesService;

  ApiResponse<Matches> _matches;

  ApiResponse<Matches> get matches => _matches;

  MatchesDetailsProvider() {
    _matchesService = MatchesService();
    fetchMatchesDetails();
  }

  fetchMatchesDetails() async {
    _matches = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Matches matches = await _matchesService.fetchMatchesDetails();
      _matches = ApiResponse.completed(matches);
      notifyListeners();
    } catch (e) {
      _matches = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
