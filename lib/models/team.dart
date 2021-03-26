import 'dart:convert';

Team teamFromJson(String str) => Team.fromJson(json.decode(str));

String teamToJson(Team data) => json.encode(data.toJson());

class Team {
  Team({
    this.teamGet,
    this.response,
  });

  String teamGet;
  List<Response> response;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamGet: json["get"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": teamGet,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.team,
    this.venue,
  });

  TeamClass team;
  Venue venue;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        team: TeamClass.fromJson(json["team"]),
        venue: Venue.fromJson(json["venue"]),
      );

  Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "venue": venue.toJson(),
      };
}

class TeamClass {
  TeamClass({
    this.id,
    this.name,
    this.country,
    this.founded,
    this.national,
    this.logo,
  });

  int id;
  String name;
  String country;
  int founded;
  bool national;
  String logo;

  factory TeamClass.fromJson(Map<String, dynamic> json) => TeamClass(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        founded: json["founded"],
        national: json["national"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "founded": founded,
        "national": national,
        "logo": logo,
      };
}

class Venue {
  Venue({
    this.id,
    this.name,
    this.address,
    this.city,
    this.capacity,
    this.surface,
    this.image,
  });

  int id;
  String name;
  String address;
  String city;
  int capacity;
  String surface;
  String image;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        capacity: json["capacity"],
        surface: json["surface"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "capacity": capacity,
        "surface": surface,
        "image": image,
      };
}
