import 'dart:convert';

Transfers transfersFromJson(String str) => Transfers.fromJson(json.decode(str));

String transfersToJson(Transfers data) => json.encode(data.toJson());

class Transfers {
  Transfers({
    this.transfersGet,
    this.response,
  });

  String transfersGet;
  List<Response> response;

  factory Transfers.fromJson(Map<String, dynamic> json) => Transfers(
        transfersGet: json["get"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": transfersGet,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.player,
    this.update,
    this.transfers,
  });

  Player player;
  DateTime update;
  List<Transfer> transfers;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        player: Player.fromJson(json["player"]),
        update: DateTime.parse(json["update"]),
        transfers: List<Transfer>.from(
            json["transfers"].map((x) => Transfer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "player": player.toJson(),
        "update": update.toIso8601String(),
        "transfers": List<dynamic>.from(transfers.map((x) => x.toJson())),
      };
}

class Player {
  Player({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Transfer {
  Transfer({
    this.date,
    this.type,
    this.teams,
  });

  DateTime date;
  String type;
  Teams teams;

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
        date: DateTime.parse(json["date"]),
        type: json["type"] == null ? null : json["type"],
        teams: Teams.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "type": type == null ? null : type,
        "teams": teams.toJson(),
      };
}

class Teams {
  Teams({
    this.teamsIn,
    this.out,
  });

  In teamsIn;
  In out;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        teamsIn: In.fromJson(json["in"]),
        out: In.fromJson(json["out"]),
      );

  Map<String, dynamic> toJson() => {
        "in": teamsIn.toJson(),
        "out": out.toJson(),
      };
}

class In {
  In({
    this.id,
    this.name,
    this.logo,
  });

  int id;
  String name;
  String logo;

  factory In.fromJson(Map<String, dynamic> json) => In(
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
