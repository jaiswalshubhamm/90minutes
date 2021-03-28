import 'package:flutter/material.dart';
import '../models/players.dart';
import '../models/transfer.dart';
import '../network/apiResponse.dart';
import '../services/players.dart';
import '../services/transfer.dart';

class PlayerProvider with ChangeNotifier {
  int _id;
  String _season;

  Map<String, String> _params = {};

  PlayerService _playerService;

  TransferService _transferService;

  ApiResponse<Players> _players;

  ApiResponse<Players> get players => _players;

  ApiResponse<Transfers> _transfer;

  ApiResponse<Transfers> get transfers => _transfer;

  PlayerProvider() {
    _playerService = PlayerService();
    _transferService = TransferService();
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

  fetchTransfer() async {
    _transfer = ApiResponse.loading('loading... ');
    try {
      Transfers transfer = await _transferService.fetchTransfers(_params);
      _transfer = ApiResponse.completed(transfer);
    } catch (e) {
      _transfer = ApiResponse.error(e.toString());
    }
  }
}
