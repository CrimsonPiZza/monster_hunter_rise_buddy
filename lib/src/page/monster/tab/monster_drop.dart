import 'package:flutter/material.dart';

import '../../../model/monster.dart';
import '../widget/monster_drop_list.dart';

class MonsterDrop extends StatelessWidget {
  const MonsterDrop({
    Key? key,
    required this.monster,
  }) : super(key: key);

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return MonsterDropList(
      monster: monster,
    );
  }
}
