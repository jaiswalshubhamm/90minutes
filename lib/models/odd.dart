class Odd {
  String get;
  int results;
  Paging paging;
  List<Response> response;

  Odd({this.get, this.results, this.paging, this.response});

  Odd.fromJson(Map<String, dynamic> json) {
    get = json['get'];

    results = json['results'];
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
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
  Fixture fixture;
  String update;
  List<Bookmakers> bookmakers;

  Response({this.league, this.fixture, this.update, this.bookmakers});

  Response.fromJson(Map<String, dynamic> json) {
    league =
        json['league'] != null ? new League.fromJson(json['league']) : null;
    fixture =
        json['fixture'] != null ? new Fixture.fromJson(json['fixture']) : null;
    update = json['update'];
    if (json['bookmakers'] != null) {
      bookmakers = new List<Bookmakers>();
      json['bookmakers'].forEach((v) {
        bookmakers.add(new Bookmakers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.league != null) {
      data['league'] = this.league.toJson();
    }
    if (this.fixture != null) {
      data['fixture'] = this.fixture.toJson();
    }
    data['update'] = this.update;
    if (this.bookmakers != null) {
      data['bookmakers'] = this.bookmakers.map((v) => v.toJson()).toList();
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

  League({this.id, this.name, this.country, this.logo, this.flag, this.season});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;
    return data;
  }
}

class Fixture {
  int id;
  String timezone;
  String date;
  int timestamp;

  Fixture({this.id, this.timezone, this.date, this.timestamp});

  Fixture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timezone'] = this.timezone;
    data['date'] = this.date;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Bookmakers {
  int id;
  String name;
  List<Bets> bets;

  Bookmakers({this.id, this.name, this.bets});

  Bookmakers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['bets'] != null) {
      bets = new List<Bets>();
      json['bets'].forEach((v) {
        bets.add(new Bets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.bets != null) {
      data['bets'] = this.bets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bets {
  int id;
  String name;
  List<Values> values;

  Bets({this.id, this.name, this.values});

  Bets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['values'] != null) {
      values = new List<Values>();
      json['values'].forEach((v) {
        values.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.values != null) {
      data['values'] = this.values.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String value;
  String odd;

  Values({this.value, this.odd});

  Values.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    odd = json['odd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['odd'] = this.odd;
    return data;
  }
}
