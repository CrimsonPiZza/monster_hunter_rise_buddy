import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/model/item.dart';
import 'package:mhr_buddy/src/page/item/widget/item_icon.dart';
import '../../widget/custom_app_bar.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        CustomAppBar(
          title: 'Item Info',
          subTitle: item.name,
        ),
        ItemIcon(item: item),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  item.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 25),
                ),
              ),
              Text(
                item.description,
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
