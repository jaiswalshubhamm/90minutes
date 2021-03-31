import 'dart:convert';

LeagueModel leagueModelFromJson(String str) =>
    LeagueModel.fromJson(json.decode(str));

String leagueModelToJson(LeagueModel data) => json.encode(data.toJson());

class LeagueModel {
  LeagueModel({
    this.leagueModelGet,
    this.response,
  });

  String leagueModelGet;
  List<Response> response;

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        leagueModelGet: json["get"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": leagueModelGet,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.league,
    this.country,
    this.seasons,
  });

  League league;
  Country country;
  List<Season> seasons;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        league: League.fromJson(json["league"]),
        country: Country.fromJson(json["country"]),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "league": league.toJson(),
        "country": country.toJson(),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.name,
    this.code,
    this.flag,
  });

  String name;
  String code;
  String flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "flag": flag,
      };
}

class League {
  League({
    this.id,
    this.name,
    this.type,
    this.logo,
  });

  int id;
  String name;
  String type;
  String logo;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "logo": logo,
      };
}

class Season {
  Season({
    this.year,
    this.start,
    this.end,
    this.current,
    this.coverage,
  });

  int year;
  DateTime start;
  DateTime end;
  bool current;
  Coverage coverage;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json["year"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        current: json["current"],
        coverage: Coverage.fromJson(json["coverage"]),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "start":
            "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
        "end":
            "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
        "current": current,
        "coverage": coverage.toJson(),
      };
}

class Coverage {
  Coverage({
    this.fixtures,
    this.standings,
    this.players,
    this.topScorers,
    this.topAssists,
    this.topCards,
    this.predictions,
    this.odds,
  });

  Fixtures fixtures;
  bool standings;
  bool players;
  bool topScorers;
  bool topAssists;
  bool topCards;
  bool predictions;
  bool odds;

  factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
        fixtures: Fixtures.fromJson(json["fixtures"]),
        standings: json["standings"],
        players: json["players"],
        topScorers: json["top_scorers"],
        topAssists: json["top_assists"],
        topCards: json["top_cards"],
        predictions: json["predictions"],
        odds: json["odds"],
      );

  Map<String, dynamic> toJson() => {
        "fixtures": fixtures.toJson(),
        "standings": standings,
        "players": players,
        "top_scorers": topScorers,
        "top_assists": topAssists,
        "top_cards": topCards,
        "predictions": predictions,
        "odds": odds,
      };
}

class Fixtures {
  Fixtures({
    this.events,
    this.lineups,
    this.statisticsFixtures,
    this.statisticsPlayers,
  });

  bool events;
  bool lineups;
  bool statisticsFixtures;
  bool statisticsPlayers;

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        events: json["events"],
        lineups: json["lineups"],
        statisticsFixtures: json["statistics_fixtures"],
        statisticsPlayers: json["statistics_players"],
      );

  Map<String, dynamic> toJson() => {
        "events": events,
        "lineups": lineups,
        "statistics_fixtures": statisticsFixtures,
        "statistics_players": statisticsPlayers,
      };
}
