import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/item.dart';
import 'package:mhr_buddy/src/page/item/widget/item_drop_list.dart';

class ItemDrop extends StatelessWidget {
  const ItemDrop({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ItemDropList(
      item: item,
    );
  }
}
