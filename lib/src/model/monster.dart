// To parse this JSON data, do
//
//     final monster = monsterFromJson(jsonString);

import 'dart:convert';

List<Monster> monsterFromJson(String str) =>
    List<Monster>.from(json.decode(str).map((x) => Monster.fromJson(x)));

String monsterToJson(List<Monster> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Monster {
  Monster({
    required this.id,
    required this.size,
    required this.name,
    required this.description,
    required this.partDamage,
    required this.partStats,
    required this.ailmentEffectiveness,
    required this.drops,
  });

  final String id;
  final String size;
  final String name;
  final String description;
  final List<PartDamage> partDamage;
  final List<PartStat> partStats;
  final List<AilmentEffectiveness> ailmentEffectiveness;
  final List<Drop> drops;

  factory Monster.fromJson(Map<String, dynamic> json) => Monster(
        id: json['id'],
        size: json['size'],
        name: json['name'],
        description: json['description'],
        partDamage: List<PartDamage>.from(
            json['part_damage'].map((x) => PartDamage.fromJson(x))),
        partStats: List<PartStat>.from(
            json['part_stats'].map((x) => PartStat.fromJson(x))),
        ailmentEffectiveness: List<AilmentEffectiveness>.from(
            json['ailment_effectiveness']
                .map((x) => AilmentEffectiveness.fromJson(x))),
        drops: List<Drop>.from(json['drops'].map((x) => Drop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'size': size,
        'name': name,
        'description': description,
        'part_damage': List<dynamic>.from(partDamage.map((x) => x.toJson())),
        'part_stats': List<dynamic>.from(partStats.map((x) => x.toJson())),
        'ailment_effectiveness':
            List<dynamic>.from(ailmentEffectiveness.map((x) => x.toJson())),
        'drops': List<dynamic>.from(drops.map((x) => x.toJson())),
      };
}

class AilmentEffectiveness {
  AilmentEffectiveness({
    required this.ailment,
    required this.buildup,
    required this.decay,
    required this.damage,
    required this.duration,
  });

  final String ailment;
  final String buildup;
  final String decay;
  final String damage;
  final String duration;

  factory AilmentEffectiveness.fromJson(Map<String, dynamic> json) =>
      AilmentEffectiveness(
        ailment: json['ailment'],
        buildup: json['buildup'],
        decay: json['decay'],
        damage: json['damage'],
        duration: json['duration'],
      );

  Map<String, dynamic> toJson() => {
        'ailment': ailment,
        'buildup': buildup,
        'decay': decay,
        'damage': damage,
        'duration': duration,
      };
}

class Drop {
  Drop({
    required this.item,
    required this.questRank,
    required this.method,
    required this.dropPart,
    required this.amount,
    required this.rate,
  });

  final String item;
  final String questRank;
  final String method;
  final String dropPart;
  final String amount;
  final String rate;

  factory Drop.fromJson(Map<String, dynamic> json) => Drop(
        item: json['item'],
        questRank: json['quest_rank'],
        method: json['method'],
        dropPart: json['part'],
        amount: json['amount'],
        rate: json['rate'],
      );

  Map<String, dynamic> toJson() => {
        'item': item,
        'quest_rank': questRank,
        'method': method,
        'part': dropPart,
        'amount': amount,
        'rate': rate,
      };
}

class PartDamage {
  PartDamage({
    required this.partDamagePart,
    required this.hitSlash,
    required this.hitStrike,
    required this.hitShell,
    required this.elementFire,
    required this.elementWater,
    required this.elementIce,
    required this.elementThunder,
    required this.elementDragon,
    required this.elementStun,
  });

  final String partDamagePart;
  final String hitSlash;
  final String hitStrike;
  final String hitShell;
  final String elementFire;
  final String elementWater;
  final String elementIce;
  final String elementThunder;
  final String elementDragon;
  final String elementStun;

  factory PartDamage.fromJson(Map<String, dynamic> json) => PartDamage(
        partDamagePart: json['part'],
        hitSlash: json['hit_slash'],
        hitStrike: json['hit_strike'],
        hitShell: json['hit_shell'],
        elementFire: json['element_fire'],
        elementWater: json['element_water'],
        elementIce: json['element_ice'],
        elementThunder: json['element_thunder'],
        elementDragon: json['element_dragon'],
        elementStun: json['element_stun'],
      );

  Map<String, dynamic> toJson() => {
        'part': partDamagePart,
        'hit_slash': hitSlash,
        'hit_strike': hitStrike,
        'hit_shell': hitShell,
        'element_fire': elementFire,
        'element_water': elementWater,
        'element_ice': elementIce,
        'element_thunder': elementThunder,
        'element_dragon': elementDragon,
        'element_stun': elementStun,
      };
}

class PartStat {
  PartStat({
    required this.partStatPart,
    required this.hp,
    required this.partStatBreak,
    required this.extract,
  });

  final String partStatPart;
  final String hp;
  final String partStatBreak;
  final String extract;

  factory PartStat.fromJson(Map<String, dynamic> json) => PartStat(
        partStatPart: json['part'],
        hp: json['hp'],
        partStatBreak: json['break'],
        extract: json['extract'],
      );

  Map<String, dynamic> toJson() => {
        'part': partStatPart,
        'hp': hp,
        'break': partStatBreak,
        'extract': extract,
      };
}
