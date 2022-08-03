import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/item.dart';
import 'package:mhr_buddy/src/page/item/widget/item_quest_list.dart';

class ItemQuest extends StatelessWidget {
  const ItemQuest({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ItemQuestList(item: item);
  }
}
