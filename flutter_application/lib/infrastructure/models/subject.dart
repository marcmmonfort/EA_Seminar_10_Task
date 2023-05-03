// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

List<Subject> subjectFromJson(String str) => List<Subject>.from(json.decode(str).map((x) => Subject.fromJson(x)));

String subjectToJson(List<Subject> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subject {
    Subject({
        required this.id,
        required this.name,
        required this.semester,
        required this.difficulty,
        this.updatedAt,
        required this.users,
    });

    final String id;
    final String name;
    final int semester;
    final String difficulty;
    final DateTime? updatedAt;
    final List<User> users;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["_id"],
        name: json["name"],
        semester: json["semester"],
        difficulty: json["difficulty"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "semester": semester,
        "difficulty": difficulty,
        "updatedAt": updatedAt?.toIso8601String(),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.surname,
        required this.email,
        required this.password,
    });

    final String id;
    final String name;
    final String surname;
    final String email;
    final String password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
    };
}