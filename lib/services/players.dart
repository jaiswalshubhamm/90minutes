import '../models/players.dart';
import '../network/httpClient.dart';
import '../network/apiPath.dart';

class PlayerService {
  Future<Players> fetchPlayers(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_players),
        params: params);
    return Players.fromJson(response);
  }
}
