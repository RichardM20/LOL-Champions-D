// To parse this JSON data, do
//
//     final championsModel = championsModelFromJson(jsonString);

import 'dart:convert';

ChampionsModel championsModelFromJson(String str) =>
    ChampionsModel.fromJson(json.decode(str));

String championsModelToJson(ChampionsModel data) => json.encode(data.toJson());

class ChampionsModel {
  Type? type;
  String? format;
  String? version;
  Map<String, ChampionData>? data;

  ChampionsModel({
    this.type,
    this.format,
    this.version,
    this.data,
  });

  factory ChampionsModel.fromJson(Map<String, dynamic> json) => ChampionsModel(
        type: typeValues.map[json["type"]]!,
        format: json["format"],
        version: json["version"] ?? "",
        data: Map.from(json["data"]!).map((k, v) =>
            MapEntry<String, ChampionData>(k, ChampionData.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "format": format,
        "version": versionValues.reverse[version],
        "data": Map.from(data!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class ChampionData {
  Version? version;
  String? id;
  String? key;
  String? name;
  String? title;
  String? blurb;
  Info? info;
  Image? image;
  List<Tag>? tags;
  String? partype;
  Map<String, double>? stats;

  ChampionData({
    this.version,
    this.id,
    this.key,
    this.name,
    this.title,
    this.blurb,
    this.info,
    this.image,
    this.tags,
    this.partype,
    this.stats,
  });

  factory ChampionData.fromJson(Map<String, dynamic> json) => ChampionData(
        version: versionValues.map[json["version"]],
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        blurb: json["blurb"],
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => tagValues.map[x]!)),
        partype: json["partype"],
        stats: Map.from(json["stats"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "version": versionValues.reverse[version],
        "id": id,
        "key": key,
        "name": name,
        "title": title,
        "blurb": blurb,
        "info": info?.toJson(),
        "image": image?.toJson(),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => tagValues.reverse[x])),
        "partype": partype,
        "stats":
            Map.from(stats!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Image {
  String? full;
  Sprite? sprite;
  Type? group;
  int? x;
  int? y;
  int? w;
  int? h;

  Image({
    this.full,
    this.sprite,
    this.group,
    this.x,
    this.y,
    this.w,
    this.h,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        full: json["full"],
        sprite: spriteValues.map[json["sprite"]]!,
        group: typeValues.map[json["group"]]!,
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
        "sprite": spriteValues.reverse[sprite],
        "group": typeValues.reverse[group],
        "x": x,
        "y": y,
        "w": w,
        "h": h,
      };
}

enum Type { CHAMPION }

final typeValues = EnumValues({"champion": Type.CHAMPION});

enum Sprite {
  CHAMPION0_PNG,
  CHAMPION1_PNG,
  CHAMPION2_PNG,
  CHAMPION3_PNG,
  CHAMPION4_PNG,
  CHAMPION5_PNG
}

final spriteValues = EnumValues({
  "champion0.png": Sprite.CHAMPION0_PNG,
  "champion1.png": Sprite.CHAMPION1_PNG,
  "champion2.png": Sprite.CHAMPION2_PNG,
  "champion3.png": Sprite.CHAMPION3_PNG,
  "champion4.png": Sprite.CHAMPION4_PNG,
  "champion5.png": Sprite.CHAMPION5_PNG
});

class Info {
  int? attack;
  int? defense;
  int? magic;
  int? difficulty;

  Info({
    this.attack,
    this.defense,
    this.magic,
    this.difficulty,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        attack: json["attack"],
        defense: json["defense"],
        magic: json["magic"],
        difficulty: json["difficulty"],
      );

  Map<String, dynamic> toJson() => {
        "attack": attack,
        "defense": defense,
        "magic": magic,
        "difficulty": difficulty,
      };
}

enum Tag { ASSASSIN, FIGHTER, MAGE, MARKSMAN, SUPPORT, TANK }

final tagValues = EnumValues({
  "Assassin": Tag.ASSASSIN,
  "Fighter": Tag.FIGHTER,
  "Mage": Tag.MAGE,
  "Marksman": Tag.MARKSMAN,
  "Support": Tag.SUPPORT,
  "Tank": Tag.TANK
});

enum Version { THE_11141 }

final versionValues = EnumValues({"11.14.1": Version.THE_11141});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
