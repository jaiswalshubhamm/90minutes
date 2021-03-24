// class Standing {
//   List<Response> response;
//   Standing({this.response});
//   Standing.fromJson(Map<String, dynamic> json) {
//     if (json['response'] != null) {
//       response = new List<Response>();
//       json['response'].forEach((v) {
//         response.add(new Response.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.response != null) {
//       data['response'] = this.response.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Response {
//   League league;
//   Response({this.league});
//   Response.fromJson(Map<String, dynamic> json) {
//     league =
//         json['league'] != null ? new League.fromJson(json['league']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.league != null) {
//       data['league'] = this.league.toJson();
//     }
//     return data;
//   }
// }

// class League {
//   int id;
//   String name;
//   String country;
//   String logo;
//   String flag;
//   int season;
//   List<Standings> standings;

//   League(
//       {this.id,
//       this.name,
//       this.country,
//       this.logo,
//       this.flag,
//       this.season,
//       this.standings});

//   League.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     country = json['country'];
//     logo = json['logo'];
//     flag = json['flag'];
//     season = json['season'];
//     if (json['standings'] != null) {
//       standings = new List<Standings>();
//       json['standings'].forEach((v) {
//         v.forEach((v) {
//           standings.add(Standings.fromJson(v));
//         });
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['country'] = this.country;
//     data['logo'] = this.logo;
//     data['flag'] = this.flag;
//     data['season'] = this.season;
//     if (this.standings != null) {
//       data['standings'] = this.standings.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Standings {
//   int rank;
//   Team team;
//   int points;
//   int goalsDiff;
//   String group;
//   String form;
//   String status;
//   String description;
//   All all;
//   All home;
//   All away;
//   String update;

//   Standings(
//       {this.rank,
//       this.team,
//       this.points,
//       this.goalsDiff,
//       this.group,
//       this.form,
//       this.status,
//       this.description,
//       this.all,
//       this.home,
//       this.away,
//       this.update});

//   Standings.fromJson(Map<String, dynamic> json) {
//     rank = json['rank'];
//     team = json['team'] != null ? new Team.fromJson(json['team']) : null;
//     points = json['points'];
//     goalsDiff = json['goalsDiff'];
//     group = json['group'];
//     form = json['form'];
//     status = json['status'];
//     description = json['description'];
//     all = json['all'] != null ? new All.fromJson(json['all']) : null;
//     home = json['home'] != null ? new All.fromJson(json['home']) : null;
//     away = json['away'] != null ? new All.fromJson(json['away']) : null;
//     update = json['update'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rank'] = this.rank;
//     if (this.team != null) {
//       data['team'] = this.team.toJson();
//     }
//     data['points'] = this.points;
//     data['goalsDiff'] = this.goalsDiff;
//     data['group'] = this.group;
//     data['form'] = this.form;
//     data['status'] = this.status;
//     data['description'] = this.description;
//     if (this.all != null) {
//       data['all'] = this.all.toJson();
//     }
//     if (this.home != null) {
//       data['home'] = this.home.toJson();
//     }
//     if (this.away != null) {
//       data['away'] = this.away.toJson();
//     }
//     data['update'] = this.update;
//     return data;
//   }
// }

// class Team {
//   int id;
//   String name;
//   String logo;

//   Team({this.id, this.name, this.logo});

//   Team.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     logo = json['logo'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['logo'] = this.logo;
//     return data;
//   }
// }

// class All {
//   int played;
//   int win;
//   int draw;
//   int lose;
//   Goals goals;

//   All({this.played, this.win, this.draw, this.lose, this.goals});

//   All.fromJson(Map<String, dynamic> json) {
//     played = json['played'];
//     win = json['win'];
//     draw = json['draw'];
//     lose = json['lose'];
//     goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['played'] = this.played;
//     data['win'] = this.win;
//     data['draw'] = this.draw;
//     data['lose'] = this.lose;
//     if (this.goals != null) {
//       data['goals'] = this.goals.toJson();
//     }
//     return data;
//   }
// }

// class Goals {
//   int forr;
//   int against;

//   Goals({this.forr, this.against});

//   Goals.fromJson(Map<String, dynamic> json) {
//     forr = json['for'];
//     against = json['against'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['for'] = this.forr;
//     data['against'] = this.against;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final standing = standingFromJson(jsonString);
// To parse this JSON data, do
//
//     final standing = standingFromJson(jsonString);

import 'dart:convert';

Standing standingFromJson(String str) => Standing.fromJson(json.decode(str));

String standingToJson(Standing data) => json.encode(data.toJson());

class Standing {
  Standing({
    this.standingGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  String standingGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        standingGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": standingGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "paging": paging.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Paging {
  Paging({
    this.current,
    this.total,
  });

  int current;
  int total;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
      };
}

class Parameters {
  Parameters({
    this.season,
    this.league,
  });

  String season;
  String league;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        season: json["season"],
        league: json["league"],
      );

  Map<String, dynamic> toJson() => {
        "season": season,
        "league": league,
      };
}

class Response {
  Response({
    this.league,
  });

  League league;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        league: League.fromJson(json["league"]),
      );

  Map<String, dynamic> toJson() => {
        "league": league.toJson(),
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
    this.standings,
  });

  int id;
  String name;
  String country;
  String logo;
  dynamic flag;
  int season;
  List<List<StandingElement>> standings;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        standings: List<List<StandingElement>>.from(json["standings"].map((x) =>
            List<StandingElement>.from(
                x.map((x) => StandingElement.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "standings": List<dynamic>.from(
            standings.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class StandingElement {
  StandingElement({
    this.rank,
    this.team,
    this.points,
    this.goalsDiff,
    this.group,
    this.form,
    this.status,
    this.description,
    this.all,
    this.home,
    this.away,
    this.update,
  });

  int rank;
  Team team;
  int points;
  int goalsDiff;
  String group;
  String form;
  Status status;
  Description description;
  All all;
  All home;
  All away;
  DateTime update;

  factory StandingElement.fromJson(Map<String, dynamic> json) =>
      StandingElement(
        rank: json["rank"],
        team: Team.fromJson(json["team"]),
        points: json["points"],
        goalsDiff: json["goalsDiff"],
        group: json["group"],
        form: json["form"],
        status: statusValues.map[json["status"]],
        description: json["description"] == null
            ? null
            : descriptionValues.map[json["description"]],
        all: All.fromJson(json["all"]),
        home: All.fromJson(json["home"]),
        away: All.fromJson(json["away"]),
        update: DateTime.parse(json["update"]),
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "team": team.toJson(),
        "points": points,
        "goalsDiff": goalsDiff,
        "group": group,
        "form": form,
        "status": statusValues.reverse[status],
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "all": all.toJson(),
        "home": home.toJson(),
        "away": away.toJson(),
        "update": update.toIso8601String(),
      };
}

class All {
  All({
    this.played,
    this.win,
    this.draw,
    this.lose,
    this.goals,
  });

  int played;
  int win;
  int draw;
  int lose;
  Goals goals;

  factory All.fromJson(Map<String, dynamic> json) => All(
        played: json["played"],
        win: json["win"],
        draw: json["draw"],
        lose: json["lose"],
        goals: Goals.fromJson(json["goals"]),
      );

  Map<String, dynamic> toJson() => {
        "played": played,
        "win": win,
        "draw": draw,
        "lose": lose,
        "goals": goals.toJson(),
      };
}

class Goals {
  Goals({
    this.goalsFor,
    this.against,
  });

  int goalsFor;
  int against;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        goalsFor: json["for"],
        against: json["against"],
      );

  Map<String, dynamic> toJson() => {
        "for": goalsFor,
        "against": against,
      };
}

enum Description { PROMOTION_EUROPA_LEAGUE_PLAY_OFFS }

final descriptionValues = EnumValues({
  "Promotion - Europa League (Play Offs)":
      Description.PROMOTION_EUROPA_LEAGUE_PLAY_OFFS
});

enum Status { SAME }

final statusValues = EnumValues({"same": Status.SAME});

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
