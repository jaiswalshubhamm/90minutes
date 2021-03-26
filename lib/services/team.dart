import '../models/team.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class TeamService {
  Future<Team> fetchTeam(Map<String, String> params) async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_team), params: params);
    return Team.fromJson(response);
  }
}
