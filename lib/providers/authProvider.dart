import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/favorite.dart';
import '../models/fixtures.dart' as fixture;
import '../services/fixtures.dart';
import '../models/user.dart';
import 'notification.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  int _id;
  String _name;
  String _email;
  String _token;
  List _favorite = [];
  FixturesService _fixtureService;
  List<fixture.Response> _favoriteMatches = [];
  NotificationProvider notification = NotificationProvider();

  List<fixture.Response> get favoriteMatches => _favoriteMatches;

  bool get isLoggedIn {
    return _isLoggedIn;
  }

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

  List get favorite {
    return _favorite;
  }

  void checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      _isLoggedIn = true;
      _name = localStorage.getString('name');
      _token = localStorage.getString('token');
      _id = localStorage.getInt('id');
      await getFavorite(_id);
      getAllFavoriteMatch();
    }
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
          await getFavorite(_id);
          getAllFavoriteMatch();
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('name', userData.success.name);
          localStorage.setInt('id', userData.success.id);
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

  void addToFovorite(int userId, int fixtureId) async {
    final url =
        'https://90minutes.co.za/api/addtofavourit?user_id=$userId&fixture_id=$fixtureId';
    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        _favorite.add(fixtureId);
        await getFavoriteMatch(fixtureId);
      }
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  void removeFromFovorite(int userId, int fixtureId) async {
    final url =
        'https://90minutes.co.za/api/removefromfavourit?user_id=$userId&fixture_id=$fixtureId';
    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        _favorite.remove(fixtureId);
        notification.cancelNotification(fixtureId);
        _favoriteMatches
            .removeWhere((element) => element.fixture.id == fixtureId);
      }
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  Future<void> getFavorite(int userId) async {
    final url = 'https://90minutes.co.za/api/getfavouritdetails/$userId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body.toString());
        Favorite favorites = Favorite.fromJson(responseJson);
        favorites.data.forEach((value) {
          _favorite.add(value.fixtureId);
        });
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }

  getFavoriteMatch(int id) async {
    _fixtureService = FixturesService();
    Map<String, String> _params = {
      "id": '$id',
    };
    try {
      fixture.Fixtures favFixture =
          await _fixtureService.fetchFixtures(_params);
      notification.zonedScheduledNotification(
        favFixture.response[0].fixture.id,
        favFixture.response[0].teams.home.name,
        favFixture.response[0].teams.away.name,
        favFixture.response[0].fixture.date,
      );
      _favoriteMatches.add(favFixture.response[0]);
    } catch (e) {
      print(e);
    }
  }

  getAllFavoriteMatch() async {
    _favorite.forEach((id) {
      getFavoriteMatch(id);
    });
    notifyListeners();
  }
}
