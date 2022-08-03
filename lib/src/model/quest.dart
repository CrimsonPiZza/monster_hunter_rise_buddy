// To parse this JSON data, do
//
//     final quest = questFromJson(jsonString);

import 'dart:convert';

List<Quest> questFromJson(String str) =>
    List<Quest>.from(json.decode(str).map((x) => Quest.fromJson(x)));

String questToJson(List<Quest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

const questTypeToReadable = {
  'event': 'Event Quest',
  'mystery': 'Anomaly Quest',
  'follower': 'Follower quest',
  'hub_master': 'Hub Quest: Master Rank',
  'hub_high': 'Hub Quest: High Rank',
  'hub_low': 'Hub Quest: Low Rank',
  'village': 'Village Quest',
  'arena': 'Arena Quest',
  'training': 'Training Quest',
};

class Quest {
  Quest({
    required this.questType,
    required this.points,
    required this.difficulty,
    required this.map,
    required this.name,
    required this.description,
    required this.mainObjective,
    required this.failureCondition,
    required this.monstersTable,
    required this.rewardsTable,
    required this.suppliesTable,
    required this.sizeAppearTable,
  });

  final String questType;
  final String points;
  final String difficulty;
  final String map;
  final String name;
  final String description;
  final String mainObjective;
  final String failureCondition;
  final List<MonstersTable> monstersTable;
  final List<RewardsTable> rewardsTable;
  final List<SuppliesTable> suppliesTable;
  final List<SizeAppearTable> sizeAppearTable;

  factory Quest.fromJson(Map<String, dynamic> json) => Quest(
        questType: questTypeToReadable[json['quest_type']].toString(),
        points: json['points'],
        difficulty: json['difficulty'],
        map: json['map'],
        name: json['name'],
        description: json['description'],
        mainObjective:
            json['main_objective'] == null ? '' : json['main_objective'],
        failureCondition:
            json['failure_condition'] == null ? '' : json['failure_condition'],
        monstersTable: List<MonstersTable>.from(
            json['monsters_table'].map((x) => MonstersTable.fromJson(x))),
        rewardsTable: List<RewardsTable>.from(
            json['rewards_table'].map((x) => RewardsTable.fromJson(x))),
        suppliesTable: List<SuppliesTable>.from(
            json['supplies_table'].map((x) => SuppliesTable.fromJson(x))),
        sizeAppearTable: List<SizeAppearTable>.from(
            json['size_appear_table'].map((x) => SizeAppearTable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'quest_type': questType,
        'points': points,
        'difficulty': difficulty,
        'map': map,
        'name': name,
        'description': description,
        'main_objective': mainObjective == null ? null : mainObjective,
        'failure_condition': failureCondition == null ? null : failureCondition,
        'monsters_table':
            List<dynamic>.from(monstersTable.map((x) => x.toJson())),
        'rewards_table':
            List<dynamic>.from(rewardsTable.map((x) => x.toJson())),
        'supplies_table':
            List<dynamic>.from(suppliesTable.map((x) => x.toJson())),
        'size_appear_table':
            List<dynamic>.from(sizeAppearTable.map((x) => x.toJson())),
      };
}

class MonstersTable {
  MonstersTable({
    required this.monster,
    required this.player,
    required this.hp,
    required this.attack,
    required this.parts,
    required this.defense,
    required this.ailment,
    required this.stun,
    required this.stamina,
    required this.mount,
  });

  final String monster;
  final String player;
  final String hp;
  final String attack;
  final String parts;
  final String defense;
  final String ailment;
  final String stun;
  final String stamina;
  final String mount;

  factory MonstersTable.fromJson(Map<String, dynamic> json) => MonstersTable(
        monster: json['monster'],
        player: json['player'],
        hp: json['hp'],
        attack: json['attack'],
        parts: json['parts'],
        defense: json['defense'],
        ailment: json['ailment'],
        stun: json['stun'],
        stamina: json['stamina'],
        mount: json['mount'],
      );

  Map<String, dynamic> toJson() => {
        'monster': monster,
        'player': player,
        'hp': hp,
        'attack': attack,
        'parts': parts,
        'defense': defense,
        'ailment': ailment,
        'stun': stun,
        'stamina': stamina,
        'mount': mount,
      };
}

class RewardsTable {
  RewardsTable({
    required this.item,
    required this.type,
    required this.amount,
    required this.rate,
  });

  final String item;
  final String type;
  final String amount;
  final String rate;

  factory RewardsTable.fromJson(Map<String, dynamic> json) => RewardsTable(
        item: json['item'],
        type: json['type'],
        amount: json['amount'],
        rate: json['rate'],
      );

  Map<String, dynamic> toJson() => {
        'item': item,
        'type': type,
        'amount': amount,
        'rate': rate,
      };
}

class SizeAppearTable {
  SizeAppearTable({
    required this.monster,
    required this.size,
    required this.appear,
  });

  final String monster;
  final List<Size> size;
  final List<Appear> appear;

  factory SizeAppearTable.fromJson(Map<String, dynamic> json) =>
      SizeAppearTable(
        monster: json['monster'],
        size: List<Size>.from(json['size'].map((x) => Size.fromJson(x))),
        appear:
            List<Appear>.from(json['appear'].map((x) => Appear.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'monster': monster,
        'size': List<dynamic>.from(size.map((x) => x.toJson())),
        'appear': List<dynamic>.from(appear.map((x) => x.toJson())),
      };
}

class Appear {
  Appear({
    required this.area,
    required this.rate,
  });

  final String area;
  final String rate;

  factory Appear.fromJson(Map<String, dynamic> json) => Appear(
        area: json['area'],
        rate: json['rate'],
      );

  Map<String, dynamic> toJson() => {
        'area': area,
        'rate': rate,
      };
}

class Size {
  Size({
    required this.size,
    required this.rate,
    required this.crown,
  });

  final String size;
  final String rate;
  final String crown;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json['size'],
        rate: json['rate'],
        crown: json['crown'],
      );

  Map<String, dynamic> toJson() => {
        'size': size,
        'rate': rate,
        'crown': crown,
      };
}

class SuppliesTable {
  SuppliesTable({
    required this.item,
    required this.amount,
  });

  final String item;
  final String amount;

  factory SuppliesTable.fromJson(Map<String, dynamic> json) => SuppliesTable(
        item: json['item'],
        amount: json['amount'],
      );

  Map<String, dynamic> toJson() => {
        'item': item,
        'amount': amount,
      };
}
