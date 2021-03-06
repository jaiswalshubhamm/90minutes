import '../models/players.dart';
import '../network/httpClient.dart';
import '../network/apiPath.dart';

class PlayerService {
  Future<Players> fetchPlayer(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_player),
        params: params);
    return Players.fromJson(response);
  }
}
