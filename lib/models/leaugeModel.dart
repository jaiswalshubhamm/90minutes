class Leagues {
  String get;
  int results;
  Paging paging;
  List<Response> response;

  Leagues({this.get, this.results, this.paging, this.response});

  Leagues.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    results = json['results'];
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['get'] = this.get;
    data['results'] = this.results;
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paging {
  int current;
  int total;

  Paging({this.current, this.total});

  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['total'] = this.total;
    return data;
  }
}

class Response {
  League league;
  Country country;
  List<Seasons> seasons;

  Response({this.league, this.country, this.seasons});

  Response.fromJson(Map<String, dynamic> json) {
    league =
        json['league'] != null ? new League.fromJson(json['league']) : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons.add(new Seasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.league != null) {
      data['league'] = this.league.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    if (this.seasons != null) {
      data['seasons'] = this.seasons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class League {
  int id;
  String name;
  String type;
  String logo;

  League({this.id, this.name, this.type, this.logo});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['logo'] = this.logo;
    return data;
  }
}

class Country {
  String name;
  String code;
  String flag;

  Country({this.name, this.code, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['flag'] = this.flag;
    return data;
  }
}

class Seasons {
  int year;
  String start;
  String end;
  bool current;
  Coverage coverage;

  Seasons({this.year, this.start, this.end, this.current, this.coverage});

  Seasons.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    start = json['start'];
    end = json['end'];
    current = json['current'];
    coverage = json['coverage'] != null
        ? new Coverage.fromJson(json['coverage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['start'] = this.start;
    data['end'] = this.end;
    data['current'] = this.current;
    if (this.coverage != null) {
      data['coverage'] = this.coverage.toJson();
    }
    return data;
  }
}

class Coverage {
  Fixtures fixtures;
  bool standings;
  bool players;
  bool topScorers;
  bool predictions;
  bool odds;

  Coverage(
      {this.fixtures,
      this.standings,
      this.players,
      this.topScorers,
      this.predictions,
      this.odds});

  Coverage.fromJson(Map<String, dynamic> json) {
    fixtures = json['fixtures'] != null
        ? new Fixtures.fromJson(json['fixtures'])
        : null;
    standings = json['standings'];
    players = json['players'];
    topScorers = json['top_scorers'];
    predictions = json['predictions'];
    odds = json['odds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fixtures != null) {
      data['fixtures'] = this.fixtures.toJson();
    }
    data['standings'] = this.standings;
    data['players'] = this.players;
    data['top_scorers'] = this.topScorers;
    data['predictions'] = this.predictions;
    data['odds'] = this.odds;
    return data;
  }
}

class Fixtures {
  bool events;
  bool lineups;
  bool statisticsFixtures;
  bool statisticsPlayers;

  Fixtures(
      {this.events,
      this.lineups,
      this.statisticsFixtures,
      this.statisticsPlayers});

  Fixtures.fromJson(Map<String, dynamic> json) {
    events = json['events'];
    lineups = json['lineups'];
    statisticsFixtures = json['statistics_fixtures'];
    statisticsPlayers = json['statistics_players'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['events'] = this.events;
    data['lineups'] = this.lineups;
    data['statistics_fixtures'] = this.statisticsFixtures;
    data['statistics_players'] = this.statisticsPlayers;
    return data;
  }
}
