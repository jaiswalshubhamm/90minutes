import '../models/leaugeModel.dart';
import '../network/httpClient.dart';
import '../network/apiPath.dart';

class LeaguesService {
  Future<Leagues> fetchLeaguesDetails() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_leagues));
    print(response);
    return Leagues.fromJson(response);
  }
}
