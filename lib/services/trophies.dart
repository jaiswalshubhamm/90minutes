import '../models/trophies.dart';
import '../network/httpClient.dart';
import '../network/apiPath.dart';

class TrophiesService {
  Future<Trophies> fetchTrophies(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_trophies),
        params: params);
    return Trophies.fromJson(response);
  }
}
