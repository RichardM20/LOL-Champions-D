// To parse this JSON data, do
//
//     final championDetailModel = championDetailModelFromJson(jsonString);

import 'dart:convert';

ChampionDetailModel championDetailModelFromJson(String str) =>
    ChampionDetailModel.fromJson(json.decode(str));

String championDetailModelToJson(ChampionDetailModel data) =>
    json.encode(data.toJson());

class ChampionDetailModel {
  String? type;
  String? format;
  String? version;
  Champion? data;

  ChampionDetailModel({
    this.type,
    this.format,
    this.version,
    this.data,
  });

  factory ChampionDetailModel.fromJson(Map<String, dynamic> json) =>
      ChampionDetailModel(
        type: json["type"],
        format: json["format"],
        version: json["version"],
        data: json["data"] == null ? null : Champion.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "format": format,
        "version": version,
        "data": data?.toJson(),
      };
}

class Champion {
  String? id;
  String? key;
  String? name;
  String? title;
  Image? image;
  List<Skin>? skins;
  String? lore;
  String? blurb;
  List<String>? allytips;
  List<String>? enemytips;
  List<String>? tags;
  String? partype;
  Info? info;
  Map<String, double>? stats;
  List<Spell>? spells;
  Passive? passive;
  List<dynamic>? recommended;

  Champion({
    this.id,
    this.key,
    this.name,
    this.title,
    this.image,
    this.skins,
    this.lore,
    this.blurb,
    this.allytips,
    this.enemytips,
    this.tags,
    this.partype,
    this.info,
    this.stats,
    this.spells,
    this.passive,
    this.recommended,
  });

  factory Champion.fromJson(Map<String, dynamic> json) => Champion(
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        skins: json["skins"] == null
            ? []
            : List<Skin>.from(json["skins"]!.map((x) => Skin.fromJson(x))),
        lore: json["lore"],
        blurb: json["blurb"],
        allytips: json["allytips"] == null
            ? []
            : List<String>.from(json["allytips"]!.map((x) => x)),
        enemytips: json["enemytips"] == null
            ? []
            : List<String>.from(json["enemytips"]!.map((x) => x)),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        partype: json["partype"],
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        stats: Map.from(json["stats"] ?? {})
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        spells: json["spells"] == null
            ? []
            : List<Spell>.from(json["spells"]!.map((x) => Spell.fromJson(x))),
        passive:
            json["passive"] == null ? null : Passive.fromJson(json["passive"]),
        recommended: json["recommended"] == null
            ? []
            : List<dynamic>.from(json["recommended"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "name": name,
        "title": title,
        "image": image?.toJson(),
        "skins": skins == null
            ? []
            : List<dynamic>.from(skins!.map((x) => x.toJson())),
        "lore": lore,
        "blurb": blurb,
        "allytips":
            allytips == null ? [] : List<dynamic>.from(allytips!.map((x) => x)),
        "enemytips": enemytips == null
            ? []
            : List<dynamic>.from(enemytips!.map((x) => x)),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "partype": partype,
        "info": info?.toJson(),
        "stats":
            Map.from(stats!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "spells": spells == null
            ? []
            : List<dynamic>.from(spells!.map((x) => x.toJson())),
        "passive": passive?.toJson(),
        "recommended": recommended == null
            ? []
            : List<dynamic>.from(recommended!.map((x) => x)),
      };
}

class Image {
  String? full;
  String? sprite;
  String? group;
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
        sprite: json["sprite"],
        group: json["group"],
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
        "sprite": sprite,
        "group": group,
        "x": x,
        "y": y,
        "w": w,
        "h": h,
      };
}

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

class Passive {
  String? name;
  String? description;
  Image? image;

  Passive({
    this.name,
    this.description,
    this.image,
  });

  factory Passive.fromJson(Map<String, dynamic> json) => Passive(
        name: json["name"],
        description: json["description"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image?.toJson(),
      };
}

class Skin {
  String? id;
  int? num;
  String? name;
  bool? chromas;

  Skin({
    this.id,
    this.num,
    this.name,
    this.chromas,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        chromas: json["chromas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "chromas": chromas,
      };
}

class Spell {
  String? id;
  String? name;
  String? description;
  String? tooltip;
  Leveltip? leveltip;
  int? maxrank;
  List<dynamic>? cooldown;
  String? cooldownBurn;
  List<int>? cost;
  String? costBurn;
  Datavalues? datavalues;
  List<List<dynamic>?>? effect;
  List<String?>? effectBurn;
  List<dynamic>? vars;
  String? costType;
  String? maxammo;
  List<int>? range;
  String? rangeBurn;
  Image? image;
  String? resource;

  Spell({
    this.id,
    this.name,
    this.description,
    this.tooltip,
    this.leveltip,
    this.maxrank,
    this.cooldown,
    this.cooldownBurn,
    this.cost,
    this.costBurn,
    this.datavalues,
    this.effect,
    this.effectBurn,
    this.vars,
    this.costType,
    this.maxammo,
    this.range,
    this.rangeBurn,
    this.image,
    this.resource,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => Spell(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tooltip: json["tooltip"],
        leveltip: json["leveltip"] == null
            ? null
            : Leveltip.fromJson(json["leveltip"]),
        maxrank: json["maxrank"],
        cooldown: json["cooldown"] == null
            ? []
            : List<dynamic>.from(json["cooldown"]!.map((x) => x)),
        cooldownBurn: json["cooldownBurn"],
        cost: json["cost"] == null
            ? []
            : List<int>.from(json["cost"]!.map((x) => x)),
        costBurn: json["costBurn"],
        datavalues: json["datavalues"] == null
            ? null
            : Datavalues.fromJson(json["datavalues"]),
        effect: json["effect"] == null
            ? []
            : List<List<dynamic>?>.from(json["effect"]!.map(
                (x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        effectBurn: json["effectBurn"] == null
            ? []
            : List<String?>.from(json["effectBurn"]!.map((x) => x)),
        vars: json["vars"] == null
            ? []
            : List<dynamic>.from(json["vars"]!.map((x) => x)),
        costType: json["costType"],
        maxammo: json["maxammo"],
        range: json["range"] == null
            ? []
            : List<int>.from(json["range"]!.map((x) => x)),
        rangeBurn: json["rangeBurn"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        resource: json["resource"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "tooltip": tooltip,
        "leveltip": leveltip?.toJson(),
        "maxrank": maxrank,
        "cooldown":
            cooldown == null ? [] : List<dynamic>.from(cooldown!.map((x) => x)),
        "cooldownBurn": cooldownBurn,
        "cost": cost == null ? [] : List<dynamic>.from(cost!.map((x) => x)),
        "costBurn": costBurn,
        "datavalues": datavalues?.toJson(),
        "effect": effect == null
            ? []
            : List<dynamic>.from(effect!.map(
                (x) => x == null ? [] : List<dynamic>.from(x.map((x) => x)))),
        "effectBurn": effectBurn == null
            ? []
            : List<dynamic>.from(effectBurn!.map((x) => x)),
        "vars": vars == null ? [] : List<dynamic>.from(vars!.map((x) => x)),
        "costType": costType,
        "maxammo": maxammo,
        "range": range == null ? [] : List<dynamic>.from(range!.map((x) => x)),
        "rangeBurn": rangeBurn,
        "image": image?.toJson(),
        "resource": resource,
      };
}

class Datavalues {
  Datavalues();

  factory Datavalues.fromJson(Map<String, dynamic> json) => Datavalues();

  Map<String, dynamic> toJson() => {};
}

class Leveltip {
  List<String>? label;
  List<String>? effect;

  Leveltip({
    this.label,
    this.effect,
  });

  factory Leveltip.fromJson(Map<String, dynamic> json) => Leveltip(
        label: json["label"] == null
            ? []
            : List<String>.from(json["label"]!.map((x) => x)),
        effect: json["effect"] == null
            ? []
            : List<String>.from(json["effect"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "label": label == null ? [] : List<dynamic>.from(label!.map((x) => x)),
        "effect":
            effect == null ? [] : List<dynamic>.from(effect!.map((x) => x)),
      };
}
