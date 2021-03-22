enum APIPath {
  fetch_countries,
  fetch_leagues,
  fetch_fixtures,
  fetch_standings,
  fetch_odd,
  fetch_h2h,
  fetch_players,
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
      case APIPath.fetch_h2h:
        return "/fixtures/headtohead";
      case APIPath.fetch_players:
        return "/players/topscorers";
      default:
        return "";
    }
  }
}
