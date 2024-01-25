// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String nama;
    String jk;

    User({
        required this.nama,
        required this.jk,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        nama: json["nama"],
        jk: json["jk"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "jk": jk,
    };
}

