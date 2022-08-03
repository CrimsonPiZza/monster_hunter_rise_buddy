import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/monster.dart';
import 'package:mhr_buddy/src/model/navigator_args.dart';
import 'package:mhr_buddy/src/page/monster/monster_detail.dart';
import 'package:mhr_buddy/src/page/widget/custom_app_bar.dart';
import 'package:simple_shadow/simple_shadow.dart';

class MonsterListView extends StatelessWidget {
  const MonsterListView(
      {Key? key, required this.quests, required this.controller})
      : super(key: key);

  final List<Monster> quests;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return quests.isEmpty
        ? const Padding(
            padding: EdgeInsets.only(top: 25),
            child: CustomAppBar(
              title: 'Monster',
              subTitle: 'Stay calm, keep hunting!',
            ),
          )
        : ListView.builder(
            controller: controller,
            restorationId: 'monster_list_view',
            itemCount: quests.length,
            physics: const BouncingScrollPhysics(),
            addAutomaticKeepAlives: false,
            itemBuilder: (BuildContext context, int index) {
              final monster = quests[index];

              if (index == 0) {
                return Column(
                  children: [
                    const CustomAppBar(
                      title: 'Monster',
                      subTitle: 'Stay calm, keep hunting!',
                    ),
                    monsterCard(context, monster)
                  ],
                );
              }
              return monsterCard(context, monster);
            },
          );
  }

  Container monsterCard(BuildContext context, Monster monster) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Card(
        elevation: 2,
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              MonsterDetail.routeName,
              arguments: MonsterDetailNavigatorArgs(
                monster.id,
                monster.name,
              ),
            );
          },
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2.5, horizontal: 2.5),
          title: Text(
            monster.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            monster.description,
            overflow: TextOverflow.ellipsis,
          ),
          leading: SimpleShadow(
            child: Image(
              height: 60,
              width: 60,
              image: AssetImage(
                'assets/images/monsters/${monster.name.toLowerCase().replaceAll(' ', '_')}.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
