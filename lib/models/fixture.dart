class FixtureModel {
  String get;
  List<Response> response;

  FixtureModel({this.get, this.response});

  FixtureModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    if (json['response'] != null) {
      response = new List<Response>();
      json['response'].forEach((v) {
        response.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['get'] = this.get;
    if (this.response != null) {
      data['response'] = this.response.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  Fixture fixture;
  League league;
  Teams teams;
  Goals goals;
  Score score;
  List<Events> events;
  List<Lineups> lineups;
  // List<Null> statistics;
  List<Player> players;

  Response(
      {this.fixture,
      this.league,
      this.teams,
      this.goals,
      this.score,
      this.events,
      this.lineups,
      // this.statistics,
      this.players});

  Response.fromJson(Map<String, dynamic> json) {
    fixture =
        json['fixture'] != null ? new Fixture.fromJson(json['fixture']) : null;
    league =
        json['league'] != null ? new League.fromJson(json['league']) : null;
    teams = json['teams'] != null ? new Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    if (json['events'] != null) {
      events = new List<Events>();
      json['events'].forEach((v) {
        events.add(new Events.fromJson(v));
      });
    }
    if (json['lineups'] != null) {
      lineups = new List<Lineups>();
      json['lineups'].forEach((v) {
        lineups.add(new Lineups.fromJson(v));
      });
    }
    // if (json['statistics'] != null) {
    //   statistics = new List<Null>();
    //   json['statistics'].forEach((v) {
    //     // statistics.add(new Null.fromJson(v));
    //   });
    // }
    if (json['players'] != null) {
      players = new List<Null>();
      json['players'].forEach((v) {
        // players.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fixture != null) {
      data['fixture'] = this.fixture.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league.toJson();
    }
    if (this.teams != null) {
      data['teams'] = this.teams.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    if (this.lineups != null) {
      data['lineups'] = this.lineups.map((v) => v.toJson()).toList();
    }
    // if (this.statistics != null) {
    //   data['statistics'] = this.statistics.map((v) => v.toJson()).toList();
    // }
    if (this.players != null) {
      data['players'] = this.players.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fixture {
  int id;
  String referee;
  String timezone;
  String date;
  int timestamp;
  Periods periods;
  Venue venue;
  Status status;

  Fixture(
      {this.id,
      this.referee,
      this.timezone,
      this.date,
      this.timestamp,
      this.periods,
      this.venue,
      this.status});

  Fixture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referee = json['referee'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
    periods =
        json['periods'] != null ? new Periods.fromJson(json['periods']) : null;
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referee'] = this.referee;
    data['timezone'] = this.timezone;
    data['date'] = this.date;
    data['timestamp'] = this.timestamp;
    if (this.periods != null) {
      data['periods'] = this.periods.toJson();
    }
    if (this.venue != null) {
      data['venue'] = this.venue.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Periods {
  int first;
  int second;

  Periods({this.first, this.second});

  Periods.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}

class Venue {
  int id;
  String name;
  String city;

  Venue({this.id, this.name, this.city});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    return data;
  }
}

class Status {
  String long;
  String short;
  int elapsed;

  Status({this.long, this.short, this.elapsed});

  Status.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    short = json['short'];
    elapsed = json['elapsed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['long'] = this.long;
    data['short'] = this.short;
    data['elapsed'] = this.elapsed;
    return data;
  }
}

class League {
  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;
  String round;

  League(
      {this.id,
      this.name,
      this.country,
      this.logo,
      this.flag,
      this.season,
      this.round});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;
    data['round'] = this.round;
    return data;
  }
}

class Teams {
  Home home;
  Home away;

  Teams({this.home, this.away});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
    away = json['away'] != null ? new Home.fromJson(json['away']) : null;
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
  int home;
  int away;

  Goals({this.home, this.away});

  Goals.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home'] = this.home;
    data['away'] = this.away;
    return data;
  }
}

class Score {
  Goals halftime;
  Goals fulltime;
  Extratime extratime;
  Extratime penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  Score.fromJson(Map<String, dynamic> json) {
    halftime =
        json['halftime'] != null ? new Goals.fromJson(json['halftime']) : null;
    fulltime =
        json['fulltime'] != null ? new Goals.fromJson(json['fulltime']) : null;
    extratime = json['extratime'] != null
        ? new Extratime.fromJson(json['extratime'])
        : null;
    penalty = json['penalty'] != null
        ? new Extratime.fromJson(json['penalty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.halftime != null) {
      data['halftime'] = this.halftime.toJson();
    }
    if (this.fulltime != null) {
      data['fulltime'] = this.fulltime.toJson();
    }
    if (this.extratime != null) {
      data['extratime'] = this.extratime.toJson();
    }
    if (this.penalty != null) {
      data['penalty'] = this.penalty.toJson();
    }
    return data;
  }
}

class Extratime {
  int home;
  int away;

  Extratime({this.home, this.away});

  Extratime.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home'] = this.home;
    data['away'] = this.away;
    return data;
  }
}

class Events {
  Time time;
  Team team;
  Player player;
  Assist assist;
  String type;
  String detail;
  String comments;

  Events(
      {this.time,
      this.team,
      this.player,
      this.assist,
      this.type,
      this.detail,
      this.comments});

  Events.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    assist =
        json['assist'] != null ? new Assist.fromJson(json['assist']) : null;
    type = json['type'];
    detail = json['detail'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time.toJson();
    }
    if (this.team != null) {
      data['team'] = this.team.toJson();
    }
    if (this.player != null) {
      data['player'] = this.player.toJson();
    }
    if (this.assist != null) {
      data['assist'] = this.assist.toJson();
    }
    data['type'] = this.type;
    data['detail'] = this.detail;
    data['comments'] = this.comments;
    return data;
  }
}

class Time {
  int elapsed;
  int extra;

  Time({this.elapsed, this.extra});

  Time.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elapsed'] = this.elapsed;
    data['extra'] = this.extra;
    return data;
  }
}

class Team {
  int id;
  String name;
  String logo;

  Team({this.id, this.name, this.logo});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class Assist {
  int id;
  String name;

  Assist({this.id, this.name});

  Assist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Lineups {
  Team team;
  Player coach;
  String formation;
  List<StartXI> startXI;
  // List<Substitutes> substitutes;

  Lineups({this.team, this.coach, this.formation, this.startXI});

  Lineups.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    coach = json['coach'] != null ? new Player.fromJson(json['coach']) : null;
    formation = json['formation'];
    if (json['startXI'] != null) {
      startXI = new List<StartXI>();
      json['startXI'].forEach((v) {
        startXI.add(new StartXI.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team.toJson();
    }
    if (this.coach != null) {
      data['coach'] = this.coach.toJson();
    }
    data['formation'] = this.formation;
    if (this.startXI != null) {
      data['startXI'] = this.startXI.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StartXI {
  Player player;

  StartXI({this.player});

  StartXI.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player.toJson();
    }
    return data;
  }
}

class Player {
  int id;
  String name;
  int number;
  String pos;

  Player({this.id, this.name, this.number, this.pos});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    pos = json['pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['pos'] = this.pos;
    return data;
  }
}
