import '../models/league.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class LeagueService {
  Future<LeagueModel> fetchLeague(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_leagues),
        params: params);
    return LeagueModel.fromJson(response);
  }
}
