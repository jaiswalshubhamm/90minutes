import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:nintyminutesflutter/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  int _id;
  String _name;
  String _email;
  String _token;

  int get id {
    return _id;
  }

  String get name {
    return _name;
  }

  String get email {
    return _email;
  }

  String get token {
    return _token;
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  void logout() async {
    _isLoggedIn = false;
    _id = null;
    _name = null;
    _email = null;
    _token = null;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    notifyListeners();
  }

  Future<void> _login(String email, String password) async {
    final url =
        'https://90minutes.co.za/api/login?email=$email&password=$password';
    try {
      final response = await http.post(Uri.parse(url));
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        _isLoggedIn = true;
        var detailUrl = 'https://90minutes.co.za/api/details';
        var header = {
          HttpHeaders.authorizationHeader:
              'Bearer ${responseData['success']['token']}',
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
          HttpHeaders.acceptHeader: 'application/json'
        };
        try {
          final detailResponse =
              await http.post(Uri.parse(detailUrl), headers: header);

          var responseJson = json.decode(detailResponse.body.toString());
          User userData = User.fromJson(responseJson);
          _id = userData.success.id;
          _name = userData.success.name;
          _email = userData.success.email;
          _token = responseData['success']['token'];
        } catch (err) {
          print(err);
        }
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', responseData['success']['token']);
      }
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _register(
      String name, String email, String password, String cPassword) async {
    final url =
        'https://90minutes.co.za/api/register?email=$email&password=$password&c_password=$cPassword&name=$name';
    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        _login(email, password);
      } else {
        _isLoggedIn = false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> register(
      String name, String email, String password, String cPassword) async {
    return _register(name, email, password, cPassword);
  }

  Future<void> login(String email, String password) async {
    return _login(email, password);
  }
}
