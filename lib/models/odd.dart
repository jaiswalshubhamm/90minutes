// To parse this JSON data, do
//
//     final odd = oddFromJson(jsonString);

import 'dart:convert';

Odd oddFromJson(String str) => Odd.fromJson(json.decode(str));

String oddToJson(Odd data) => json.encode(data.toJson());

class Odd {
  Odd({
    this.oddGet,
    this.response,
  });

  String oddGet;
  List<Response> response;

  factory Odd.fromJson(Map<String, dynamic> json) => Odd(
        oddGet: json["get"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": oddGet,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.league,
    this.fixture,
    this.update,
    this.bookmakers,
  });

  League league;
  Fixture fixture;
  DateTime update;
  List<Bookmaker> bookmakers;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        league: League.fromJson(json["league"]),
        fixture: Fixture.fromJson(json["fixture"]),
        update: DateTime.parse(json["update"]),
        bookmakers: List<Bookmaker>.from(
            json["bookmakers"].map((x) => Bookmaker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "league": league.toJson(),
        "fixture": fixture.toJson(),
        "update": update.toIso8601String(),
        "bookmakers": List<dynamic>.from(bookmakers.map((x) => x.toJson())),
      };
}

class Bookmaker {
  Bookmaker({
    this.id,
    this.name,
    this.bets,
  });

  int id;
  String name;
  List<Bet> bets;

  factory Bookmaker.fromJson(Map<String, dynamic> json) => Bookmaker(
        id: json["id"],
        name: json["name"],
        bets: List<Bet>.from(json["bets"].map((x) => Bet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bets": List<dynamic>.from(bets.map((x) => x.toJson())),
      };
}

class Bet {
  Bet({
    this.id,
    this.name,
    this.values,
  });

  int id;
  String name;
  List<Value> values;

  factory Bet.fromJson(Map<String, dynamic> json) => Bet(
        id: json["id"],
        name: json["name"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.value,
    this.odd,
  });

  String value;
  String odd;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        value: json["value"],
        odd: json["odd"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "odd": odd,
      };
}

class Fixture {
  Fixture({
    this.id,
    this.timezone,
    this.date,
    this.timestamp,
  });

  int id;
  String timezone;
  DateTime date;
  int timestamp;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        timezone: json["timezone"],
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "timezone": timezone,
        "date": date.toIso8601String(),
        "timestamp": timestamp,
      };
}

class League {
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
  });

  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
      };
}
