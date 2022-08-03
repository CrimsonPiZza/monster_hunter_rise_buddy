import 'package:flutter/services.dart' show rootBundle;
import 'package:mhr_buddy/src/model/item.dart';
import 'package:mhr_buddy/src/model/monster.dart';
import 'package:mhr_buddy/src/model/quest.dart';

getJson(String path) async {
  return await rootBundle.loadString(path);
}

class GameData {
  static List<Monster> monsters = [];
  static List<Item> items = [];
  static List<Quest> quests = [];
}

loadData() async {
  GameData.monsters =
      monsterFromJson(await getJson('assets/jsons/monsters.json'));
  GameData.items = itemFromJson(await getJson('assets/jsons/items.json'));
  GameData.quests = questFromJson(await getJson('assets/jsons/quests.json'));
}
