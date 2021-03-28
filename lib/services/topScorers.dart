import '../models/players.dart';
import '../network/httpClient.dart';
import '../network/apiPath.dart';

class TopScorersService {
  Future<Players> fetchTopScorers(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_topScorers),
        params: params);
    return Players.fromJson(response);
  }
}
