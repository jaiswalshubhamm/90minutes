import 'package:nintyminutesflutter/models/leaugeModel.dart';
import 'package:nintyminutesflutter/network/apiPath.dart';
import 'package:nintyminutesflutter/network/httpClient.dart';

class LeaguesService {
  Future<Leagues> fetchLeaguesDetails() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_leagues));
    print(response);
    return Leagues.fromJson(response);
  }
}
