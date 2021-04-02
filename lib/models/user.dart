import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.success,
  });

  Success success;

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: Success.fromJson(json["success"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success.toJson(),
      };
}

class Success {
  Success({
    this.id,
    this.roleId,
    this.name,
    this.email,
    this.avatar,
    this.emailVerifiedAt,
    this.settings,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int roleId;
  String name;
  String email;
  String avatar;
  dynamic emailVerifiedAt;
  List<dynamic> settings;
  DateTime createdAt;
  DateTime updatedAt;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        emailVerifiedAt: json["email_verified_at"],
        settings: List<dynamic>.from(json["settings"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "avatar": avatar,
        "email_verified_at": emailVerifiedAt,
        "settings": List<dynamic>.from(settings.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
