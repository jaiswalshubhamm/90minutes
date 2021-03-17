import '../models/fixtures.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class FixturesService {
  Future<Fixtures> fetchFixtures(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_fixtures),
        params: params);
    return Fixtures.fromJson(response);
  }
}
