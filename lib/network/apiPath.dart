enum APIPath {
  fetch_countries,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.fetch_countries:
        return "/countries";
      default:
        return "";
    }
  }
}
