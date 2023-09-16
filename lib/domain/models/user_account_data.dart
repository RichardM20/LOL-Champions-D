// To parse this JSON data, do
//
//     final userAccountData = userAccountDataFromJson(jsonString);

import 'dart:convert';

UserAccountData userAccountDataFromJson(String str) =>
    UserAccountData.fromJson(json.decode(str));

String userAccountDataToJson(UserAccountData data) =>
    json.encode(data.toJson());

class UserAccountData {
  String? id;
  String? accountId;
  String? puuid;
  String? name;
  int? profileIconId;
  int? revisionDate;
  int? summonerLevel;

  UserAccountData({
    this.id,
    this.accountId,
    this.puuid,
    this.name,
    this.profileIconId,
    this.revisionDate,
    this.summonerLevel,
  });

  factory UserAccountData.fromJson(Map<String, dynamic> json) =>
      UserAccountData(
        id: json["id"],
        accountId: json["accountId"],
        puuid: json["puuid"],
        name: json["name"],
        profileIconId: json["profileIconId"],
        revisionDate: json["revisionDate"],
        summonerLevel: json["summonerLevel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountId": accountId,
        "puuid": puuid,
        "name": name,
        "profileIconId": profileIconId,
        "revisionDate": revisionDate,
        "summonerLevel": summonerLevel,
      };
}
