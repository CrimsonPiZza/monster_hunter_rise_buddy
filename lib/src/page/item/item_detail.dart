import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:mhr_buddy/src/data/game_data.dart';
import 'package:mhr_buddy/src/model/item.dart';
import 'package:mhr_buddy/src/page/item/tab/item_info.dart';
import 'package:mhr_buddy/src/page/item/tab/item_quest.dart';
import 'package:mhr_buddy/src/page/item/widget/item_drop_list.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key, required this.name}) : super(key: key);

  final String name;
  static const routeName = '/item/details';

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail>
    with SingleTickerProviderStateMixin {
  late Item item;

  late int currentPage;
  late TabController tabController;

  bool isError = false;

  @override
  void initState() {
    try {
      item = GameData.items.firstWhere(
        (itemElement) => itemElement.name == widget.name,
      );
    } catch (e) {
      isError = true;
    }

    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(
      () {
        currentPage = newPage;
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color unselectedColor = Colors.grey;
    return SafeArea(
      child: Scaffold(
        body: isError
            ? const Center(
                child: Text('Item Not Found'),
              )
            : _ItemPage(
                unselectedColor: unselectedColor,
                tabController: tabController,
                item: item,
                currentPage: currentPage,
              ),
      ),
    );
  }
}

class _ItemPage extends StatelessWidget {
  const _ItemPage({
    Key? key,
    required this.unselectedColor,
    required this.tabController,
    required this.item,
    required this.currentPage,
  }) : super(key: key);

  final Color unselectedColor;
  final TabController tabController;
  final Item item;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      fit: StackFit.expand,
      icon: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: null,
          icon: Icon(
            Icons.arrow_upward_rounded,
            color: unselectedColor,
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(500),
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
      showIcon: true,
      width: MediaQuery.of(context).size.width * 0.8,
      barColor: Theme.of(context).colorScheme.background,
      start: 2,
      end: 0,
      bottom: 10,
      alignment: Alignment.bottomCenter,
      iconHeight: 35,
      iconWidth: 35,
      reverse: false,
      hideOnScroll: true,
      scrollOpposite: false,
      onBottomBarHidden: () {},
      onBottomBarShown: () {},
      body: (context, controller) => TabBarView(
        controller: tabController,
        dragStartBehavior: DragStartBehavior.start,
        physics: const BouncingScrollPhysics(),
        children: [
          ItemInfo(item: item),
          ItemInfo(item: item),
          ItemDropList(item: item),
          ItemQuest(item: item),
        ],
      ),
      child: TheTabBar(
        tabController: tabController,
        currentPage: currentPage,
        unselectedColor: unselectedColor,
      ),
    );
  }
}

class TheTabBar extends StatelessWidget {
  const TheTabBar({
    Key? key,
    required this.tabController,
    required this.currentPage,
    required this.unselectedColor,
  }) : super(key: key);

  final TabController tabController;
  final int currentPage;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
      controller: tabController,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onBackground,
            width: 4,
          ),
          insets: const EdgeInsets.fromLTRB(16, 0, 16, 8)),
      tabs: [
        SizedBox(
          height: 55,
          width: 40,
          child: Center(
            child: Icon(
              Icons.description_rounded,
              color: currentPage == 0
                  ? Theme.of(context).colorScheme.onBackground
                  : unselectedColor,
            ),
          ),
        ),
        SizedBox(
          height: 55,
          width: 40,
          child: Center(
            child: Icon(
              Icons.build,
              color: currentPage == 1
                  ? Theme.of(context).colorScheme.onBackground
                  : unselectedColor,
            ),
          ),
        ),
        SizedBox(
          height: 55,
          width: 40,
          child: Center(
            child: Icon(
              Icons.diamond,
              color: currentPage == 2
                  ? Theme.of(context).colorScheme.onBackground
                  : unselectedColor,
            ),
          ),
        ),
        SizedBox(
          height: 55,
          width: 40,
          child: Center(
            child: Icon(
              Icons.assignment,
              color: currentPage == 3
                  ? Theme.of(context).colorScheme.onBackground
                  : unselectedColor,
            ),
          ),
        ),
      ],
    );
  }
}
