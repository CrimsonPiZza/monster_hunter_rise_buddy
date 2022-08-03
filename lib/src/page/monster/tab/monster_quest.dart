import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/data/game_data.dart';
import 'package:mhr_buddy/src/model/quest.dart';
import 'package:mhr_buddy/src/page/monster/widget/monster_quest_list.dart';

import '../../../model/monster.dart';

class MonsterQuest extends StatelessWidget {
  const MonsterQuest({
    Key? key,
    required this.monster,
  }) : super(key: key);

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    List<Quest> quests = GameData.quests
        .where((quest) =>
            quest.sizeAppearTable
                .indexWhere((sizeTable) => sizeTable.monster == monster.name) !=
            -1)
        .toList();

    return MonsterQuestList(quests: quests, monster: monster);
  }
}
