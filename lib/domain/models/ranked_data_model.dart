// To parse this JSON data, do
//
//     final leaguesChallengerModel = leaguesChallengerModelFromJson(jsonString);

import 'dart:convert';

LeaguesChallengerModel leaguesChallengerModelFromJson(String str) =>
    LeaguesChallengerModel.fromJson(json.decode(str));

String leaguesChallengerModelToJson(LeaguesChallengerModel data) =>
    json.encode(data.toJson());

class LeaguesChallengerModel {
  List<League>? leagues;

  LeaguesChallengerModel({
    this.leagues,
  });

  factory LeaguesChallengerModel.fromJson(Map<String, dynamic> json) =>
      LeaguesChallengerModel(
        leagues: json["leagues"] == null
            ? []
            : List<League>.from(
                json["leagues"]!.map((x) => League.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leagues": leagues == null
            ? []
            : List<dynamic>.from(leagues!.map((x) => x.toJson())),
      };
}

class League {
  String? leagueId;
  String? queueType;
  String? tier;
  String? rank;
  String? summonerId;
  String? summonerName;
  int? leaguePoints;
  int? wins;
  int? losses;
  bool? veteran;
  bool? inactive;
  bool? freshBlood;
  bool? hotStreak;

  League({
    this.leagueId,
    this.queueType,
    this.tier,
    this.rank,
    this.summonerId,
    this.summonerName,
    this.leaguePoints,
    this.wins,
    this.losses,
    this.veteran,
    this.inactive,
    this.freshBlood,
    this.hotStreak,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        leagueId: json["leagueId"],
        queueType: json["queueType"],
        tier: json["tier"],
        rank: json["rank"],
        summonerId: json["summonerId"],
        summonerName: json["summonerName"],
        leaguePoints: json["leaguePoints"],
        wins: json["wins"],
        losses: json["losses"],
        veteran: json["veteran"],
        inactive: json["inactive"],
        freshBlood: json["freshBlood"],
        hotStreak: json["hotStreak"],
      );

  Map<String, dynamic> toJson() => {
        "leagueId": leagueId,
        "queueType": queueType,
        "tier": tier,
        "rank": rank,
        "summonerId": summonerId,
        "summonerName": summonerName,
        "leaguePoints": leaguePoints,
        "wins": wins,
        "losses": losses,
        "veteran": veteran,
        "inactive": inactive,
        "freshBlood": freshBlood,
        "hotStreak": hotStreak,
      };
}
