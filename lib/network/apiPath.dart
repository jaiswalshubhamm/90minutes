enum APIPath {
  fetch_countries,
  fetch_leagues,
  fetch_fixtures,
  fetch_standings,
  fetch_odd,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.fetch_countries:
        return "/countries";
      case APIPath.fetch_leagues:
        return "/leagues";
      case APIPath.fetch_fixtures:
        return "/fixtures";
      case APIPath.fetch_standings:
        return "/standings";
      case APIPath.fetch_odd:
        return "/odds";
      default:
        return "";
    }
  }
}
