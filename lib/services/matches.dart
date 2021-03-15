import 'package:nintyminutesflutter/models/matches.dart';
import 'package:nintyminutesflutter/network/apiPath.dart';
import 'package:nintyminutesflutter/network/httpClient.dart';

class MatchesService {
  Future<Matches> fetchMatchesDetails() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_matches));
    print(response);
    return Matches.fromJson(response);
  }
}
