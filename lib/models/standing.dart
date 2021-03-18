class Standing {
  List<Response> response;
  Standing({this.response});
  Standing.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = new List<Response>();
      json['response'].forEach((v) {
        response.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  League league;
  Response({this.league});
  Response.fromJson(Map<String, dynamic> json) {
    league =
        json['league'] != null ? new League.fromJson(json['league']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.league != null) {
      data['league'] = this.league.toJson();
    }
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
  List<Standings> standings;

  League(
      {this.id,
      this.name,
      this.country,
      this.logo,
      this.flag,
      this.season,
      this.standings});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
    if (json['standings'] != null) {
      standings = new List<Standings>();
      json['standings'][0].forEach((v) {
        standings.add(new Standings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;
    if (this.standings != null) {
      data['standings'] = this.standings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Standings {
  int rank;
  Team team;
  int points;
  int goalsDiff;
  String group;
  String form;
  String status;
  String description;
  All all;
  All home;
  All away;
  String update;

  Standings(
      {this.rank,
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
      this.update});

  Standings.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    points = json['points'];
    goalsDiff = json['goalsDiff'];
    group = json['group'];
    form = json['form'];
    status = json['status'];
    description = json['description'];
    all = json['all'] != null ? new All.fromJson(json['all']) : null;
    home = json['home'] != null ? new All.fromJson(json['home']) : null;
    away = json['away'] != null ? new All.fromJson(json['away']) : null;
    update = json['update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    if (this.team != null) {
      data['team'] = this.team.toJson();
    }
    data['points'] = this.points;
    data['goalsDiff'] = this.goalsDiff;
    data['group'] = this.group;
    data['form'] = this.form;
    data['status'] = this.status;
    data['description'] = this.description;
    if (this.all != null) {
      data['all'] = this.all.toJson();
    }
    if (this.home != null) {
      data['home'] = this.home.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away.toJson();
    }
    data['update'] = this.update;
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

class All {
  int played;
  int win;
  int draw;
  int lose;
  Goals goals;

  All({this.played, this.win, this.draw, this.lose, this.goals});

  All.fromJson(Map<String, dynamic> json) {
    played = json['played'];
    win = json['win'];
    draw = json['draw'];
    lose = json['lose'];
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['played'] = this.played;
    data['win'] = this.win;
    data['draw'] = this.draw;
    data['lose'] = this.lose;
    if (this.goals != null) {
      data['goals'] = this.goals.toJson();
    }
    return data;
  }
}

class Goals {
  int forr;
  int against;

  Goals({this.forr, this.against});

  Goals.fromJson(Map<String, dynamic> json) {
    forr = json['for'];
    against = json['against'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['for'] = this.forr;
    data['against'] = this.against;
    return data;
  }
}
