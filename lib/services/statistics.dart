import '../models/statistics.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class StatisticsService {
  Future<Statistics> fetchStatistics(Map<String, String> params) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.fetch_statistics),
        params: params);
    return Statistics.fromJson(response);
  }
}
