import 'package:flutter/material.dart';
import '../models/leaugeModel.dart';
import '../network/apiResponse.dart';
import '../services/leagues.dart';

class LeaguesDetailsProvider with ChangeNotifier {
  LeaguesService _leaguesService;

  ApiResponse<Leagues> _leagues;

  ApiResponse<Leagues> get leagues => _leagues;

  LeaguesDetailsProvider() {
    _leaguesService = LeaguesService();
    fetchLeaguesDetails();
  }

  fetchLeaguesDetails() async {
    _leagues = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Leagues leagues = await _leaguesService.fetchLeaguesDetails();
      _leagues = ApiResponse.completed(leagues);
      notifyListeners();
    } catch (e) {
      _leagues = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
