import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'apiBase.dart';
import 'apiException.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String> params}) async {
    var responseJson;

    var uri = APIBase.baseURL +
        url +
        ((params != null) ? this.queryParameters(params) : "");
    var header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'x-rapidapi-host': "v3.football.api-sports.io",
      'x-rapidapi-key': "fc466db0a1b07a4049cc27cc28a92c30"
      // c1d23053708b123ee28aa1ec1ea60cad"
    };
    try {
      final response = await http.get(uri, headers: header);
      print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  Future<dynamic> postData(String url, dynamic body) async {
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response =
          await http.post(APIBase.baseURL + url, body: body, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
