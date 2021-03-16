import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return "https://v3.football.api-sports.io/";
    } else {
      return "https://v3.football.api-sports.io/";
    }
  }
}
