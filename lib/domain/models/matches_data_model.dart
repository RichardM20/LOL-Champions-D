// To parse this JSON data, do
//
//     final matchesData = matchesDataFromJson(jsonString);

import 'dart:convert';

MatchesData matchesDataFromJson(String str) =>
    MatchesData.fromJson(json.decode(str));

String matchesDataToJson(MatchesData data) => json.encode(data.toJson());

class MatchesData {
  List<String>? matchs;

  MatchesData({
    this.matchs,
  });

  factory MatchesData.fromJson(Map<String, dynamic> json) => MatchesData(
        matchs: json["matchs"] == null
            ? []
            : List<String>.from(json["matchs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "matchs":
            matchs == null ? [] : List<dynamic>.from(matchs!.map((x) => x)),
      };
}
