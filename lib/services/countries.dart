import 'package:nintyminutesflutter/models/countries.dart';
import 'package:nintyminutesflutter/network/apiPath.dart';
import 'package:nintyminutesflutter/network/httpClient.dart';

class CountriesService {
  Future<Countries> fetchCountriesDetails() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_countries));
    print(response);
    return Countries.fromJson(response);
  }
}
