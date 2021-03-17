import 'package:flutter/foundation.dart';
import '../models/odd.dart';
import '../services/oddService.dart';
import '../network/apiResponse.dart';

class OddProvider with ChangeNotifier {
  int _id;
  Map<String, String> _params = {};

  OddService _oddService;

  ApiResponse<Odd> _odd;

  ApiResponse<Odd> get odd => _odd;

  void setId(int id) {
    _id = id;
    _params = {"fixture": '$_id', 'bookmaker': '8', 'bet': '1'};
    fetchOdd();
  }

  OddProvider() {
    _oddService = OddService();
  }

  fetchOdd() async {
    _odd = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Odd odd = await _oddService.fetchOdd(_params);
      _odd = ApiResponse.completed(odd);
      notifyListeners();
    } catch (e) {
      _odd = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
