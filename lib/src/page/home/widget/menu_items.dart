import 'package:mhr_buddy/src/page/item/item_list.dart';
import 'package:mhr_buddy/src/page/monster/monster_list.dart';
import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/page/widget/menu_item.dart';
import '../../../model/menu_item.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<AppMenuItem> menuItems = [
      AppMenuItem('Monsters', MonsterList.routeName,
          'assets/images/monsters/gore_magala.png'),
      AppMenuItem(
          'Items', ItemList.routeName, 'assets/images/items/mega_potion.png',
          size: 64),
      AppMenuItem(
          'Quests', '/quest', 'assets/images/items/appreciation_ticket.png',
          size: 64),
      AppMenuItem('Weapons', '/weapon',
          'assets/images/weapons/great_swords/2133723340.webp',
          size: 98),
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemCount: menuItems.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((BuildContext context, int index) {
          final item = menuItems[index];
          return MenuItemWidget(context, item);
        }),
      ),
    );
  }
}
