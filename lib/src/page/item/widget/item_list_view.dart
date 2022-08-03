import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/item.dart';
import 'package:mhr_buddy/src/model/navigator_args.dart';
import 'package:mhr_buddy/src/page/item/item_detail.dart';
import 'package:mhr_buddy/src/page/widget/custom_app_bar.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key, required this.items, required this.controller})
      : super(key: key);

  final List<Item> items;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Padding(
            padding: EdgeInsets.only(top: 25),
            child: CustomAppBar(
              title: 'Item',
              subTitle: 'Oh look! Something to get your hand on!',
            ),
          )
        : ListView.builder(
            controller: controller,
            restorationId: 'item_list_view',
            itemCount: items.length,
            physics: const BouncingScrollPhysics(),
            addAutomaticKeepAlives: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];

              if (index == 0) {
                return Column(
                  children: [
                    const CustomAppBar(
                      title: 'Item',
                      subTitle: 'Oh look! Something to get your hand on!',
                    ),
                    itemCard(context, item)
                  ],
                );
              }
              return itemCard(context, item);
            },
          );
  }

  Container itemCard(BuildContext context, Item item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Card(
        elevation: 2,
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              ItemDetail.routeName,
              arguments: ItemDetailNavigatorArgs(
                item.name,
              ),
            );
          },
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2.5, horizontal: 2.5),
          title: Text(
            item.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            item.description,
            overflow: TextOverflow.ellipsis,
          ),
          leading: SimpleShadow(
            child: Image(
              height: 60,
              width: 60,
              image: AssetImage(
                'assets/images/items/${item.name.toLowerCase().replaceAll(' ', '_')}.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
