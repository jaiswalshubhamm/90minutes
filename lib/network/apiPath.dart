enum APIPath {
  fetch_countries,
  fetch_leagues,
  fetch_fixtures,
  fetch_standings,
  fetch_odd,
  fetch_h2h,
  fetch_topScorers,
  fetch_player,
  fetch_team,
  fetch_statistics,
  fetch_transfers
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
      case APIPath.fetch_topScorers:
        return "/players/topscorers";
      case APIPath.fetch_player:
        return "/players";
      case APIPath.fetch_team:
        return "/teams";
      case APIPath.fetch_statistics:
        return "/teams/statistics";
      case APIPath.fetch_transfers:
        return "/transfers";
      default:
        return "";
    }
  }
}
