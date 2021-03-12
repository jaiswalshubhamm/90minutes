import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  int _id;
  String _name;
  String _email;
  String _token;

  String get name {
    return _name;
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  void logout() {
    _isLoggedIn = false;
    _id = null;
    _name = null;
    _email = null;
    _token = null;
    notifyListeners();
  }

  Future<void> _login(String email, String password) async {
    final url =
        'https://90minutes.greenappleinfotech.com/api/login?email=$email&password=$password';
    try {
      final response = await http.post(url);
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        _isLoggedIn = true;
        _id = 0;
        _name = "Raj";
        _email = "default@gmail.com";
        _token = responseData['success']['token'];
      }
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _register(
      String name, String email, String password, String cPassword) async {
    final url =
        'https://90minutes.greenappleinfotech.com/api/register?email=$email&password=$password&c_password=$cPassword&name=$name';
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        print("register success");
        _login(email, password);
      } else {
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
