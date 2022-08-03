import 'package:flutter/material.dart';

import '../../../model/monster.dart';
import '../widget/ailment_effectiveness_table.dart';
import '../../widget/custom_app_bar.dart';
import '../widget/part_effectiveness_table.dart';
import '../widget/part_info_table.dart';

class MonsterPhysiology extends StatelessWidget {
  const MonsterPhysiology({
    Key? key,
    required this.monster,
  }) : super(key: key);

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        CustomAppBar(
          title: 'Physiology',
          subTitle: monster.name,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          child: TablesColumn(monster: monster),
        )
      ],
    );
  }
}

class TablesColumn extends StatelessWidget {
  const TablesColumn({
    Key? key,
    required this.monster,
  }) : super(key: key);

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Text(
              'Hit Damage To Part',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          PartEffectivenessTable(
            monster: monster,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 20, 5, 10),
            child: Text(
              'Part Info',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          PartInfoTable(
            monster: monster,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 20, 5, 10),
            child: Text(
              'Ailment Effectiveness',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          AilmentEffectivenessTable(
            monster: monster,
          )
        ],
      ),
    );
  }
}
