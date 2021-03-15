enum APIPath {
  fetch_countries,
  fetch_leagues,
  fetch_matches,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.fetch_countries:
        return "/countries";
      case APIPath.fetch_leagues:
        return "/leagues";
      case APIPath.fetch_matches:
        return "/fixtures";
      default:
        return "";
    }
  }
}
