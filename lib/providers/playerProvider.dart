import 'package:flutter/material.dart';
import '../models/players.dart';
import '../network/apiResponse.dart';
import '../services/players.dart';

class PlayerProvider with ChangeNotifier {
  int _id;
  String _season;

  Map<String, String> _params = {};

  PlayerService _playerService;

  ApiResponse<Players> _players;

  ApiResponse<Players> get players => _players;

  PlayerProvider() {
    _playerService = PlayerService();
  }

  void setPlayerParams(int id, String season) async {
    _id = id;
    _season = season;
    _params = {"id": '$_id', "season": _season};
    await fetchPlayer();
    notifyListeners();
  }

  fetchPlayer() async {
    _players = ApiResponse.loading('loading... ');
    try {
      Players players = await _playerService.fetchPlayer(_params);
      _players = ApiResponse.completed(players);
    } catch (e) {
      _players = ApiResponse.error(e.toString());
    }
  }
}
