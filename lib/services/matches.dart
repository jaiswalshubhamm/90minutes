import '../models/matches.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class MatchesService {
  Future<Matches> fetchMatches(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_matches),
        params: params);
    print(response);
    return Matches.fromJson(response);
  }
}
