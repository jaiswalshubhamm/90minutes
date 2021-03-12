import 'package:flutter/material.dart';
import 'package:nintyminutesflutter/models/countries.dart';
import 'package:nintyminutesflutter/network/apiResponse.dart';
import 'package:nintyminutesflutter/services/countries.dart';

class CountriesDetailsProvider with ChangeNotifier {
  CountriesService _countriesService;

  ApiResponse<Countries> _countries;

  ApiResponse<Countries> get countries => _countries;

  CountriesDetailsProvider() {
    _countriesService = CountriesService();
    fetchCountriesDetails();
  }

  fetchCountriesDetails() async {
    _countries = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      Countries countries = await _countriesService.fetchCountriesDetails();
      _countries = ApiResponse.completed(countries);
      notifyListeners();
    } catch (e) {
      _countries = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
