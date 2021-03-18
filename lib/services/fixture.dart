import '../models/fixture.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class FixtureService {
  Future<FixtureModel> fetchFixture(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_fixtures),
        params: params);
    return FixtureModel.fromJson(response);
  }
}
