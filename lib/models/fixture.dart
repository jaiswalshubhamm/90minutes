import 'dart:convert';

FixtureModel fixtureModelFromJson(String str) =>
    FixtureModel.fromJson(json.decode(str));

String fixtureModelToJson(FixtureModel data) => json.encode(data.toJson());

class FixtureModel {
  FixtureModel({
    this.fixtureModelGet,
    this.response,
  });

  String fixtureModelGet;
  List<Response> response;

  factory FixtureModel.fromJson(Map<String, dynamic> json) => FixtureModel(
        fixtureModelGet: json["get"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": fixtureModelGet,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.fixture,
    this.league,
    this.teams,
    this.goals,
    this.score,
    this.events,
    this.lineups,
    this.statistics,
    this.players,
  });

  Fixture fixture;
  League league;
  Teams teams;
  Goals goals;
  Score score;
  List<Event> events;
  List<Lineup> lineups;
  List<ResponseStatistic> statistics;
  List<ResponsePlayer> players;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        fixture: Fixture.fromJson(json["fixture"]),
        league: League.fromJson(json["league"]),
        teams: Teams.fromJson(json["teams"]),
        goals: Goals.fromJson(json["goals"]),
        score: Score.fromJson(json["score"]),
        events: (json["events"] == null)
            ? null
            : List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        lineups: (json["lineups"] == null)
            ? null
            : List<Lineup>.from(json["lineups"].map((x) => Lineup.fromJson(x))),
        statistics: (json["statistics"] == null)
            ? null
            : List<ResponseStatistic>.from(
                json["statistics"].map((x) => ResponseStatistic.fromJson(x))),
        players: (json["players"] == null)
            ? null
            : List<ResponsePlayer>.from(
                json["players"].map((x) => ResponsePlayer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fixture": fixture.toJson(),
        "league": league.toJson(),
        "teams": teams.toJson(),
        "goals": goals.toJson(),
        "score": score.toJson(),
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "lineups": List<dynamic>.from(lineups.map((x) => x.toJson())),
        "statistics": List<dynamic>.from(statistics.map((x) => x.toJson())),
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    this.time,
    this.team,
    this.player,
    this.assist,
    this.type,
    this.detail,
    this.comments,
  });

  Time time;
  Team team;
  Assist player;
  Assist assist;
  String type;
  String detail;
  dynamic comments;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        time: Time.fromJson(json["time"]),
        team: Team.fromJson(json["team"]),
        player: Assist.fromJson(json["player"]),
        assist: Assist.fromJson(json["assist"]),
        type: json["type"],
        detail: json["detail"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "time": time.toJson(),
        "team": team.toJson(),
        "player": player.toJson(),
        "assist": assist.toJson(),
        "type": type,
        "detail": detail,
        "comments": comments,
      };
}

class Assist {
  Assist({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Assist.fromJson(Map<String, dynamic> json) => Assist(
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : name,
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.logo,
    this.update,
    this.winner,
  });

  int id;
  String name;
  String logo;
  DateTime update;
  bool winner;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        update: json["update"] == null ? null : DateTime.parse(json["update"]),
        winner: json["winner"] == null ? null : json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "update": update == null ? null : update.toIso8601String(),
        "winner": winner == null ? null : winner,
      };
}

class Time {
  Time({
    this.elapsed,
    this.extra,
  });

  int elapsed;
  int extra;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        elapsed: json["elapsed"],
        extra: json["extra"] == null ? null : json["extra"],
      );

  Map<String, dynamic> toJson() => {
        "elapsed": elapsed,
        "extra": extra == null ? null : extra,
      };
}

class Fixture {
  Fixture({
    this.id,
    this.referee,
    this.timezone,
    this.date,
    this.timestamp,
    this.periods,
    this.venue,
    this.status,
  });

  int id;
  String referee;
  String timezone;
  DateTime date;
  int timestamp;
  Periods periods;
  Venue venue;
  Status status;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        referee: json["referee"],
        timezone: json["timezone"],
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
        periods: Periods.fromJson(json["periods"]),
        venue: Venue.fromJson(json["venue"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "referee": referee,
        "timezone": timezone,
        "date": date.toIso8601String(),
        "timestamp": timestamp,
        "periods": periods.toJson(),
        "venue": venue.toJson(),
        "status": status.toJson(),
      };
}

class Periods {
  Periods({
    this.first,
    this.second,
  });

  int first;
  int second;

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json["first"],
        second: json["second"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
      };
}

class Status {
  Status({
    this.long,
    this.short,
    this.elapsed,
  });

  String long;
  String short;
  int elapsed;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: json["long"],
        short: json["short"],
        elapsed: json["elapsed"],
      );

  Map<String, dynamic> toJson() => {
        "long": long,
        "short": short,
        "elapsed": elapsed,
      };
}

class Venue {
  Venue({
    this.id,
    this.name,
    this.city,
  });

  int id;
  String name;
  String city;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
      };
}

class Teams {
  Home home;
  Home away;

  Teams({this.home, this.away});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    away = json['away'] != null ? Home.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.home != null) {
      data['home'] = this.home.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away.toJson();
    }
    return data;
  }
}

class Home {
  int id;
  String name;
  String logo;
  bool winner;

  Home({this.id, this.name, this.logo, this.winner});

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['winner'] = this.winner;
    return data;
  }
}

class Goals {
  Goals({
    this.home,
    this.away,
  });

  dynamic home;
  dynamic away;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
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
    this.round,
  });

  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;
  String round;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        round: json["round"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "round": round,
      };
}

class Score {
  Score({
    this.halftime,
    this.fulltime,
    this.extratime,
    this.penalty,
  });

  Goals halftime;
  Goals fulltime;
  Goals extratime;
  Goals penalty;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: Goals.fromJson(json["halftime"]),
        fulltime: Goals.fromJson(json["fulltime"]),
        extratime: Goals.fromJson(json["extratime"]),
        penalty: Goals.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "halftime": halftime.toJson(),
        "fulltime": fulltime.toJson(),
        "extratime": extratime.toJson(),
        "penalty": penalty.toJson(),
      };
}

class Lineup {
  Lineup({
    this.team,
    this.coach,
    this.formation,
    this.startXi,
    this.substitutes,
  });

  Team team;
  Assist coach;
  String formation;
  List<StartXi> startXi;
  List<StartXi> substitutes;

  factory Lineup.fromJson(Map<String, dynamic> json) => Lineup(
        team: Team.fromJson(json["team"]),
        coach: Assist.fromJson(json["coach"]),
        formation: json["formation"],
        startXi:
            List<StartXi>.from(json["startXI"].map((x) => StartXi.fromJson(x))),
        substitutes: List<StartXi>.from(
            json["substitutes"].map((x) => StartXi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "coach": coach.toJson(),
        "formation": formation,
        "startXI": List<dynamic>.from(startXi.map((x) => x.toJson())),
        "substitutes": List<dynamic>.from(substitutes.map((x) => x.toJson())),
      };
}

class StartXi {
  StartXi({
    this.player,
  });

  StartXiPlayer player;

  factory StartXi.fromJson(Map<String, dynamic> json) => StartXi(
        player: StartXiPlayer.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "player": player.toJson(),
      };
}

class StartXiPlayer {
  StartXiPlayer({
    this.id,
    this.name,
    this.number,
    this.pos,
  });

  int id;
  String name;
  int number;
  String pos;

  factory StartXiPlayer.fromJson(Map<String, dynamic> json) => StartXiPlayer(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        pos: json["pos"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "pos": pos,
      };
}

class ResponsePlayer {
  ResponsePlayer({
    this.team,
    this.players,
  });

  Team team;
  List<PurplePlayer> players;

  factory ResponsePlayer.fromJson(Map<String, dynamic> json) => ResponsePlayer(
        team: Team.fromJson(json["team"]),
        players: List<PurplePlayer>.from(
            json["players"].map((x) => PurplePlayer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
      };
}

class PurplePlayer {
  PurplePlayer({
    this.player,
    this.statistics,
  });

  FluffyPlayer player;
  List<PlayerStatistic> statistics;

  factory PurplePlayer.fromJson(Map<String, dynamic> json) => PurplePlayer(
        player: FluffyPlayer.fromJson(json["player"]),
        statistics: List<PlayerStatistic>.from(
            json["statistics"].map((x) => PlayerStatistic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "player": player.toJson(),
        "statistics": List<dynamic>.from(statistics.map((x) => x.toJson())),
      };
}

class FluffyPlayer {
  FluffyPlayer({
    this.id,
    this.name,
    this.photo,
  });

  int id;
  String name;
  String photo;

  factory FluffyPlayer.fromJson(Map<String, dynamic> json) => FluffyPlayer(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
      };
}

class PlayerStatistic {
  PlayerStatistic({
    this.games,
    this.offsides,
    this.shots,
    this.goals,
    this.passes,
    this.tackles,
    this.duels,
    this.dribbles,
    this.fouls,
    this.cards,
    this.penalty,
  });

  Games games;
  int offsides;
  Shots shots;
  StatisticGoals goals;
  Passes passes;
  Tackles tackles;
  Duels duels;
  Dribbles dribbles;
  Fouls fouls;
  Cards cards;
  Penalty penalty;

  factory PlayerStatistic.fromJson(Map<String, dynamic> json) =>
      PlayerStatistic(
        games: Games.fromJson(json["games"]),
        offsides: json["offsides"] == null ? null : json["offsides"],
        shots: Shots.fromJson(json["shots"]),
        goals: StatisticGoals.fromJson(json["goals"]),
        passes: Passes.fromJson(json["passes"]),
        tackles: Tackles.fromJson(json["tackles"]),
        duels: Duels.fromJson(json["duels"]),
        dribbles: Dribbles.fromJson(json["dribbles"]),
        fouls: Fouls.fromJson(json["fouls"]),
        cards: Cards.fromJson(json["cards"]),
        penalty: Penalty.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "games": games.toJson(),
        "offsides": offsides == null ? null : offsides,
        "shots": shots.toJson(),
        "goals": goals.toJson(),
        "passes": passes.toJson(),
        "tackles": tackles.toJson(),
        "duels": duels.toJson(),
        "dribbles": dribbles.toJson(),
        "fouls": fouls.toJson(),
        "cards": cards.toJson(),
        "penalty": penalty.toJson(),
      };
}

class Cards {
  Cards({
    this.yellow,
    this.red,
  });

  int yellow;
  int red;

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        yellow: json["yellow"],
        red: json["red"],
      );

  Map<String, dynamic> toJson() => {
        "yellow": yellow,
        "red": red,
      };
}

class Dribbles {
  Dribbles({
    this.attempts,
    this.success,
    this.past,
  });

  int attempts;
  int success;
  int past;

  factory Dribbles.fromJson(Map<String, dynamic> json) => Dribbles(
        attempts: json["attempts"],
        success: json["success"],
        past: json["past"] == null ? null : json["past"],
      );

  Map<String, dynamic> toJson() => {
        "attempts": attempts,
        "success": success,
        "past": past == null ? null : past,
      };
}

class Duels {
  Duels({
    this.total,
    this.won,
  });

  int total;
  int won;

  factory Duels.fromJson(Map<String, dynamic> json) => Duels(
        total: json["total"],
        won: json["won"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "won": won,
      };
}

class Fouls {
  Fouls({
    this.drawn,
    this.committed,
  });

  int drawn;
  int committed;

  factory Fouls.fromJson(Map<String, dynamic> json) => Fouls(
        drawn: json["drawn"],
        committed: json["committed"],
      );

  Map<String, dynamic> toJson() => {
        "drawn": drawn,
        "committed": committed,
      };
}

class Games {
  Games({
    this.minutes,
    this.number,
    this.position,
    this.rating,
    this.captain,
    this.substitute,
  });

  int minutes;
  int number;
  String position;
  String rating;
  bool captain;
  bool substitute;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        minutes: json["minutes"],
        number: json["number"],
        position: json["position"],
        rating: json["rating"],
        captain: json["captain"],
        substitute: json["substitute"],
      );

  Map<String, dynamic> toJson() => {
        "minutes": minutes,
        "number": number,
        "position": position,
        "rating": rating,
        "captain": captain,
        "substitute": substitute,
      };
}

class StatisticGoals {
  StatisticGoals({
    this.total,
    this.conceded,
    this.assists,
    this.saves,
  });

  int total;
  int conceded;
  int assists;
  int saves;

  factory StatisticGoals.fromJson(Map<String, dynamic> json) => StatisticGoals(
        total: json["total"] == null ? null : json["total"],
        conceded: json["conceded"],
        assists: json["assists"] == null ? null : json["assists"],
        saves: json["saves"] == null ? null : json["saves"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "conceded": conceded,
        "assists": assists == null ? null : assists,
        "saves": saves == null ? null : saves,
      };
}

class Passes {
  Passes({
    this.total,
    this.key,
    this.accuracy,
  });

  int total;
  int key;
  String accuracy;

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
        total: json["total"],
        key: json["key"],
        accuracy: json["accuracy"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "key": key,
        "accuracy": accuracy,
      };
}

class Penalty {
  Penalty({
    this.won,
    this.commited,
    this.scored,
    this.missed,
    this.saved,
  });

  dynamic won;
  dynamic commited;
  int scored;
  int missed;
  int saved;

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        won: json["won"],
        commited: json["commited"],
        scored: json["scored"],
        missed: json["missed"],
        saved: json["saved"] == null ? null : json["saved"],
      );

  Map<String, dynamic> toJson() => {
        "won": won,
        "commited": commited,
        "scored": scored,
        "missed": missed,
        "saved": saved == null ? null : saved,
      };
}

class Shots {
  Shots({
    this.total,
    this.on,
  });

  int total;
  int on;

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
        total: json["total"],
        on: json["on"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "on": on,
      };
}

class Tackles {
  Tackles({
    this.total,
    this.blocks,
    this.interceptions,
  });

  int total;
  int blocks;
  int interceptions;

  factory Tackles.fromJson(Map<String, dynamic> json) => Tackles(
        total: json["total"] == null ? null : json["total"],
        blocks: json["blocks"],
        interceptions: json["interceptions"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "blocks": blocks,
        "interceptions": interceptions,
      };
}

class ResponseStatistic {
  ResponseStatistic({
    this.team,
    this.statistics,
  });

  Team team;
  List<StatisticStatistic> statistics;

  factory ResponseStatistic.fromJson(Map<String, dynamic> json) =>
      ResponseStatistic(
        team: Team.fromJson(json["team"]),
        statistics: List<StatisticStatistic>.from(
            json["statistics"].map((x) => StatisticStatistic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "statistics": List<dynamic>.from(statistics.map((x) => x.toJson())),
      };
}

class StatisticStatistic {
  StatisticStatistic({
    this.type,
    this.value,
  });

  String type;
  dynamic value;

  factory StatisticStatistic.fromJson(Map<String, dynamic> json) =>
      StatisticStatistic(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}
