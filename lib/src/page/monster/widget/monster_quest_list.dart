import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/monster.dart';
import 'package:mhr_buddy/src/model/quest.dart';
import 'package:mhr_buddy/src/page/widget/custom_app_bar.dart';

class MonsterQuestList extends StatelessWidget {
  const MonsterQuestList({
    Key? key,
    required this.quests,
    required this.monster,
  }) : super(key: key);

  final List<Quest> quests;
  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quests.length,
      // shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        final quest = quests[index];
        if (index == 0) {
          return Column(
            children: [
              CustomAppBar(
                title: 'Quest With This Monster',
                subTitle: monster.name,
              ),
              questCard(quest)
            ],
          );
        }

        if (index == quests.length - 1) {
          return Container(
            margin: const EdgeInsets.only(bottom: 65),
            child: questCard(quest),
          );
        }

        return questCard(quest);
      }),
    );
  }

  Padding questCard(Quest quest) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(quest.name),
          subtitle: Text(quest.map),
        ),
      ),
    );
  }
}
