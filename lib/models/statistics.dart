import 'dart:convert';

Statistics statisticsFromJson(String str) =>
    Statistics.fromJson(json.decode(str));

String statisticsToJson(Statistics data) => json.encode(data.toJson());

class Statistics {
  Statistics({
    this.statisticsGet,
    this.response,
  });

  String statisticsGet;
  Response response;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        statisticsGet: json["get"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "get": statisticsGet,
        "response": response.toJson(),
      };
}

class Response {
  Response({
    this.league,
    this.team,
    this.form,
    this.fixtures,
    this.goals,
    this.biggest,
    this.cleanSheet,
    this.failedToScore,
  });

  League league;
  Team team;
  String form;
  Fixtures fixtures;
  ResponseGoals goals;
  Biggest biggest;
  CleanSheet cleanSheet;
  CleanSheet failedToScore;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        league: League.fromJson(json["league"]),
        team: Team.fromJson(json["team"]),
        form: json["form"],
        fixtures: Fixtures.fromJson(json["fixtures"]),
        goals: ResponseGoals.fromJson(json["goals"]),
        biggest: Biggest.fromJson(json["biggest"]),
        cleanSheet: CleanSheet.fromJson(json["clean_sheet"]),
        failedToScore: CleanSheet.fromJson(json["failed_to_score"]),
      );

  Map<String, dynamic> toJson() => {
        "league": league.toJson(),
        "team": team.toJson(),
        "form": form,
        "fixtures": fixtures.toJson(),
        "goals": goals.toJson(),
        "biggest": biggest.toJson(),
        "clean_sheet": cleanSheet.toJson(),
        "failed_to_score": failedToScore.toJson(),
      };
}

class Biggest {
  Biggest({
    this.streak,
    this.wins,
    this.loses,
    this.goals,
  });

  Streak streak;
  Loses wins;
  Loses loses;
  BiggestGoals goals;

  factory Biggest.fromJson(Map<String, dynamic> json) => Biggest(
        streak: Streak.fromJson(json["streak"]),
        wins: Loses.fromJson(json["wins"]),
        loses: Loses.fromJson(json["loses"]),
        goals: BiggestGoals.fromJson(json["goals"]),
      );

  Map<String, dynamic> toJson() => {
        "streak": streak.toJson(),
        "wins": wins.toJson(),
        "loses": loses.toJson(),
        "goals": goals.toJson(),
      };
}

class BiggestGoals {
  BiggestGoals({
    this.goalsFor,
    this.against,
  });

  PurpleAgainst goalsFor;
  PurpleAgainst against;

  factory BiggestGoals.fromJson(Map<String, dynamic> json) => BiggestGoals(
        goalsFor: PurpleAgainst.fromJson(json["for"]),
        against: PurpleAgainst.fromJson(json["against"]),
      );

  Map<String, dynamic> toJson() => {
        "for": goalsFor.toJson(),
        "against": against.toJson(),
      };
}

class PurpleAgainst {
  PurpleAgainst({
    this.home,
    this.away,
  });

  int home;
  int away;

  factory PurpleAgainst.fromJson(Map<String, dynamic> json) => PurpleAgainst(
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
      };
}

class Loses {
  Loses({
    this.home,
    this.away,
  });

  String home;
  String away;

  factory Loses.fromJson(Map<String, dynamic> json) => Loses(
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
      };
}

class Streak {
  Streak({
    this.wins,
    this.draws,
    this.loses,
  });

  int wins;
  int draws;
  int loses;

  factory Streak.fromJson(Map<String, dynamic> json) => Streak(
        wins: json["wins"],
        draws: json["draws"],
        loses: json["loses"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "draws": draws,
        "loses": loses,
      };
}

class CleanSheet {
  CleanSheet({
    this.home,
    this.away,
    this.total,
  });

  int home;
  int away;
  int total;

  factory CleanSheet.fromJson(Map<String, dynamic> json) => CleanSheet(
        home: json["home"],
        away: json["away"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
        "total": total,
      };
}

class Fixtures {
  Fixtures({
    this.played,
    this.wins,
    this.draws,
    this.loses,
  });

  CleanSheet played;
  CleanSheet wins;
  CleanSheet draws;
  CleanSheet loses;

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        played: CleanSheet.fromJson(json["played"]),
        wins: CleanSheet.fromJson(json["wins"]),
        draws: CleanSheet.fromJson(json["draws"]),
        loses: CleanSheet.fromJson(json["loses"]),
      );

  Map<String, dynamic> toJson() => {
        "played": played.toJson(),
        "wins": wins.toJson(),
        "draws": draws.toJson(),
        "loses": loses.toJson(),
      };
}

class ResponseGoals {
  ResponseGoals({
    this.goalsFor,
    this.against,
  });

  FluffyAgainst goalsFor;
  FluffyAgainst against;

  factory ResponseGoals.fromJson(Map<String, dynamic> json) => ResponseGoals(
        goalsFor: FluffyAgainst.fromJson(json["for"]),
        against: FluffyAgainst.fromJson(json["against"]),
      );

  Map<String, dynamic> toJson() => {
        "for": goalsFor.toJson(),
        "against": against.toJson(),
      };
}

class FluffyAgainst {
  FluffyAgainst({
    this.total,
    this.average,
  });

  CleanSheet total;
  Average average;

  factory FluffyAgainst.fromJson(Map<String, dynamic> json) => FluffyAgainst(
        total: CleanSheet.fromJson(json["total"]),
        average: Average.fromJson(json["average"]),
      );

  Map<String, dynamic> toJson() => {
        "total": total.toJson(),
        "average": average.toJson(),
      };
}

class Average {
  Average({
    this.home,
    this.away,
    this.total,
  });

  String home;
  String away;
  String total;

  factory Average.fromJson(Map<String, dynamic> json) => Average(
        home: json["home"],
        away: json["away"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
        "total": total,
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

class Team {
  Team({
    this.id,
    this.name,
    this.logo,
  });

  int id;
  String name;
  String logo;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}
