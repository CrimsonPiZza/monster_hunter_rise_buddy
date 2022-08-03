import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/data/game_data.dart';
import 'package:mhr_buddy/src/model/item.dart';
import 'package:mhr_buddy/src/model/quest.dart';
import 'package:mhr_buddy/src/page/widget/custom_app_bar.dart';

class ItemQuestList extends StatelessWidget {
  const ItemQuestList({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    List<Quest> quests = GameData.quests
        .where((quest) =>
            quest.rewardsTable
                .indexWhere((reward) => reward.item == item.name) !=
            -1)
        .toList();

    List<QuestReward> questRewards = [];
    for (var quest in quests) {
      for (var reward in quest.rewardsTable) {
        if (reward.item == item.name) {
          questRewards.add(QuestReward(
              name: quest.name,
              map: quest.map,
              type: quest.questType,
              reward: reward));
        }
      }
    }

    return quests.isEmpty
        ? Column(
            children: [
              CustomAppBar(
                title: 'Quest Reward',
                subTitle: item.name,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'No quest with ${item.name} as reward available!',
                  ),
                ),
              )
            ],
          )
        : ListView.builder(
            itemCount: questRewards.length,
            // shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              final questReward = questRewards[index];
              if (index == 0) {
                return Column(
                  children: [
                    CustomAppBar(
                      title: 'Quest Reward',
                      subTitle: item.name,
                    ),
                    questCard(context, questReward)
                  ],
                );
              }

              if (index == questRewards.length - 1) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 65),
                  child: questCard(context, questReward),
                );
              }

              return questCard(context, questReward);
            }),
          );
  }

  Padding questCard(context, QuestReward questReward) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            questReward.name,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(questReward.map),
              Card(
                color: Theme.of(context).backgroundColor,
                elevation: 2,
                child: SizedBox(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Center(
                      child: Text(
                        questReward.type,
                        textWidthBasis: TextWidthBasis.parent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(questReward.reward.amount),
              Text(questReward.reward.rate)
            ],
          ),
        ),
      ),
    );
  }
}

class QuestReward {
  final String name;
  final String map;
  final String type;
  final RewardsTable reward;

  const QuestReward(
      {required this.name,
      required this.map,
      required this.type,
      required this.reward});
}
