import '../models/countries.dart';
import '../network/apiPath.dart';
import '../network/httpClient.dart';

class CountriesService {
  Future<Countries> fetchCountriesDetails() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_countries));
    print(response);
    return Countries.fromJson(response);
  }
}
