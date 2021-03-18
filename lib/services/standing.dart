import '../models/standing.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class StandingService {
  Future<Standing> fetchStanding(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_standings),
        params: params);
    return Standing.fromJson(response);
  }
}
