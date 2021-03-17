import '../models/odd.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class OddService {
  Future<Odd> fetchOdd(Map<String, String> params) async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_odd), params: params);
    return Odd.fromJson(response);
  }
}
