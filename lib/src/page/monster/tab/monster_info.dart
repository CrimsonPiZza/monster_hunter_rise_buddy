import 'package:flutter/material.dart';

import '../../../model/monster.dart';
import '../../widget/custom_app_bar.dart';
import '../widget/monster_icon.dart';

class MonsterInfo extends StatelessWidget {
  const MonsterInfo({
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
          title: 'Monster Info',
          subTitle: monster.name,
        ),
        MonsterIcon(monster: monster),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  monster.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 25),
                ),
              ),
              Text(
                monster.description,
                style:
                    Theme.of(context).textTheme.caption?.copyWith(fontSize: 18),
              ),
            ],
          ),
        )
      ],
    );
  }
}
