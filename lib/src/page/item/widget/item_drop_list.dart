import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/data/game_data.dart';
import 'package:mhr_buddy/src/model/item.dart';
import 'package:mhr_buddy/src/model/navigator_args.dart';
import 'package:mhr_buddy/src/page/monster/monster_detail.dart';
import 'package:mhr_buddy/src/page/widget/custom_app_bar.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../model/monster.dart';

class ItemDropList extends StatelessWidget {
  const ItemDropList({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    List<MonsterDrop> monsterDrops = [];
    for (var monster in GameData.monsters) {
      for (var drop in monster.drops) {
        if (drop.item == item.name) {
          monsterDrops.add(
            MonsterDrop(name: monster.name, id: monster.id, drop: drop),
          );
        }
      }
    }

    return monsterDrops.isEmpty
        ? Column(
            children: [
              CustomAppBar(
                title: 'Drop',
                subTitle: item.name,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'No monster with ${item.name} as reward available!',
                  ),
                ),
              )
            ],
          )
        : ListView.builder(
            restorationId: 'monster_drop_list',
            itemCount: monsterDrops.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              final MonsterDrop monsterDrop = monsterDrops[index];

              if (index == 0) {
                return Column(
                  children: [
                    CustomAppBar(
                      title: 'Drop',
                      subTitle: item.name,
                    ),
                    dropCard(monsterDrop, context)
                  ],
                );
              }

              if (index == monsterDrops.length - 1) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 65),
                  child: dropCard(monsterDrop, context),
                );
              }

              return dropCard(monsterDrop, context);
            }),
          );
  }

  Padding dropCard(MonsterDrop monsterDrop, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 2,
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              MonsterDetail.routeName,
              arguments: MonsterDetailNavigatorArgs(
                monsterDrop.id,
                monsterDrop.name,
              ),
            );
          },
          leading: SimpleShadow(
            child: Image(
              height: 48,
              width: 48,
              image: AssetImage(
                'assets/images/monsters/${monsterDrop.name.toLowerCase().replaceAll(' ', '_')}.png',
              ),
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(monsterDrop.name),
              Card(
                color: Theme.of(context).backgroundColor,
                elevation: 2,
                child: SizedBox(
                  width: 30,
                  height: 20,
                  child: Center(
                    child: Text(
                      monsterDrop.drop.amount,
                      textWidthBasis: TextWidthBasis.parent,
                    ),
                  ),
                ),
              ),
            ],
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                monsterDrop.drop.questRank,
              ),
              Card(
                color: Theme.of(context).backgroundColor,
                elevation: 2,
                child: SizedBox(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Center(
                      child: Text(
                        monsterDrop.drop.dropPart != ''
                            ? '${monsterDrop.drop.method} - ${monsterDrop.drop.dropPart}'
                            : monsterDrop.drop.method,
                        textWidthBasis: TextWidthBasis.parent,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                monsterDrop.drop.rate,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MonsterDrop {
  final String name;
  final String id;
  final Drop drop;

  const MonsterDrop({required this.name, required this.id, required this.drop});
}
