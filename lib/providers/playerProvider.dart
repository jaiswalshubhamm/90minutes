import 'package:flutter/material.dart';
import '../models/players.dart';
import '../models/transfer.dart';
import '../models/trophies.dart';
import '../models/fixture.dart';
import '../network/apiResponse.dart';
import '../services/players.dart';
import '../services/trophies.dart';
import '../services/transfer.dart';
import '../services/fixture.dart';

class PlayerProvider with ChangeNotifier {
  int _id;
  String _season;

  Map<String, String> _params = {};

  PlayerService _playerService;

  TransferService _transferService;

  TrophiesService _trophiesService;

  FixtureService _fixtureService;

  ApiResponse<Players> _players;

  ApiResponse<Players> get players => _players;

  ApiResponse<Transfers> _transfer;

  ApiResponse<Transfers> get transfers => _transfer;

  ApiResponse<Trophies> _trophies;

  ApiResponse<Trophies> get trophies => _trophies;

  ApiResponse<FixtureModel> _last10;

  ApiResponse<FixtureModel> get last10 => _last10;

  PlayerProvider() {
    _playerService = PlayerService();
    _transferService = TransferService();
    _trophiesService = TrophiesService();
    _fixtureService = FixtureService();
  }

  void setPlayerParams(int id, String season) async {
    _id = id;
    _season = season;
    _params = {"id": '$_id', "season": _season};
    await fetchPlayer();
    notifyListeners();
    await fetchTransfer();
    notifyListeners();
    await fetchTrophies();
    notifyListeners();
    await fetchLast10();
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

  fetchTransfer() async {
    Map<String, String> _transferParams = {
      "player": '${_players.data?.response[0].player.id}',
    };
    _transfer = ApiResponse.loading('loading... ');
    try {
      Transfers transfer =
          await _transferService.fetchTransfers(_transferParams);
      _transfer = ApiResponse.completed(transfer);
    } catch (e) {
      _transfer = ApiResponse.error(e.toString());
    }
  }

  fetchTrophies() async {
    Map<String, String> _trophiesParams = {
      "player": '${_players.data?.response[0].player.id}',
    };
    _trophies = ApiResponse.loading('loading... ');
    try {
      Trophies trophies = await _trophiesService.fetchTrophies(_trophiesParams);
      _trophies = ApiResponse.completed(trophies);
    } catch (e) {
      _trophies = ApiResponse.error(e.toString());
    }
  }

  fetchLast10() async {
    Map<String, String> _last10Params = {
      'team': '${_players.data?.response[0].statistics[0].team.id}',
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
}
