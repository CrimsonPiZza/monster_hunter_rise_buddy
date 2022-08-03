import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/navigator_args.dart';
import 'package:mhr_buddy/src/page/item/item_detail.dart';
import 'package:mhr_buddy/src/page/widget/custom_app_bar.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../model/monster.dart';

class MonsterDropList extends StatelessWidget {
  const MonsterDropList({
    Key? key,
    required this.monster,
  }) : super(key: key);

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      restorationId: 'monster_drop_list',
      itemCount: monster.drops.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        final Drop drop = monster.drops[index];

        if (index == 0) {
          return Column(
            children: [
              CustomAppBar(
                title: 'Drop',
                subTitle: monster.name,
              ),
              dropCard(drop, context)
            ],
          );
        }

        if (index == monster.drops.length - 1) {
          return Container(
            margin: const EdgeInsets.only(bottom: 65),
            child: dropCard(drop, context),
          );
        }

        return dropCard(drop, context);
      }),
    );
  }

  Padding dropCard(Drop drop, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 2,
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              ItemDetail.routeName,
              arguments: ItemDetailNavigatorArgs(drop.item),
            );
          },
          leading: SimpleShadow(
            child: Image(
              height: 48,
              width: 48,
              image: AssetImage(
                'assets/images/items/${drop.item.toLowerCase().replaceAll(' ', '_')}.png',
              ),
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(drop.item),
              Card(
                color: Theme.of(context).backgroundColor,
                elevation: 2,
                child: SizedBox(
                  width: 30,
                  height: 20,
                  child: Center(
                    child: Text(
                      drop.amount,
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
                drop.dropPart != ''
                    ? '${drop.method} - ${drop.dropPart}'
                    : drop.method,
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
                        drop.questRank,
                        textWidthBasis: TextWidthBasis.parent,
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
                drop.rate,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
