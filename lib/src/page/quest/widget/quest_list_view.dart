import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/quest.dart';
import 'package:mhr_buddy/src/page/widget/custom_app_bar.dart';
import 'package:simple_shadow/simple_shadow.dart';

class QuestListView extends StatelessWidget {
  const QuestListView(
      {Key? key, required this.quests, required this.controller})
      : super(key: key);

  final List<Quest> quests;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return quests.isEmpty
        ? const Padding(
            padding: EdgeInsets.only(top: 25),
            child: CustomAppBar(
              title: 'Quest',
              subTitle: 'Stay calm, keep hunting!',
            ),
          )
        : ListView.builder(
            controller: controller,
            restorationId: 'quest_list_view',
            itemCount: quests.length,
            physics: const BouncingScrollPhysics(),
            addAutomaticKeepAlives: false,
            itemBuilder: (BuildContext context, int index) {
              final quest = quests[index];

              if (index == 0) {
                return Column(
                  children: [
                    const CustomAppBar(
                      title: 'Quest',
                      subTitle: 'Stay calm, keep hunting!',
                    ),
                    questCard(context, quest)
                  ],
                );
              }
              return questCard(context, quest);
            },
          );
  }

  Container questCard(BuildContext context, Quest quest) {
    double size = MediaQuery.of(context).size.width / 8;
    List<String> appearMonsterNoDupe = [];
    quest.sizeAppearTable.forEach(((tableRow) {
      if (!appearMonsterNoDupe.contains(tableRow.monster)) {
        appearMonsterNoDupe.add(tableRow.monster);
      }
    }));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Card(
        elevation: 2,
        child: ListTile(
          onTap: () {},
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2.5, horizontal: 2.5),
          title: Text(
            quest.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: appearMonsterNoDupe.map((questMonster) {
              return SimpleShadow(
                child: Image(
                  height: size,
                  width: size,
                  image: AssetImage(
                    'assets/images/monsters/${questMonster.toLowerCase().replaceAll(' ', '_')}.png',
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
