import 'dart:convert';

Trophies trophiesFromJson(String str) => Trophies.fromJson(json.decode(str));

String trophiesToJson(Trophies data) => json.encode(data.toJson());

class Trophies {
  Trophies({
    this.trophiesGet,
    this.response,
  });

  String trophiesGet;
  List<Response> response;

  factory Trophies.fromJson(Map<String, dynamic> json) => Trophies(
        trophiesGet: json["get"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": trophiesGet,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.league,
    this.country,
    this.season,
    this.place,
  });

  String league;
  String country;
  String season;
  String place;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        league: json["league"],
        country: json["country"],
        season: json["season"],
        place: json["place"],
      );

  Map<String, dynamic> toJson() => {
        "league": league,
        "country": country,
        "season": season,
        "place": place,
      };
}
