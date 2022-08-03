import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:mhr_buddy/src/data/game_data.dart';
import 'package:mhr_buddy/src/page/monster/tab/monster_drop.dart';
import 'package:mhr_buddy/src/page/monster/tab/monster_info.dart';
import 'package:mhr_buddy/src/page/monster/tab/monster_physiology.dart';
import 'package:mhr_buddy/src/page/monster/tab/monster_quest.dart';
import '../../model/monster.dart';

class MonsterDetail extends StatefulWidget {
  const MonsterDetail({Key? key, required this.name, required this.id})
      : super(key: key);

  final String name;
  final String id;
  static const routeName = '/monster/details';

  @override
  State<MonsterDetail> createState() => _MonsterDetailState();
}

class _MonsterDetailState extends State<MonsterDetail>
    with SingleTickerProviderStateMixin {
  late Monster monster;

  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    monster = GameData.monsters.firstWhere((monElement) =>
        monElement.name == widget.name || monElement.id == widget.id);

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
    Color selectedColor = Theme.of(context).colorScheme.onBackground;

    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          fit: StackFit.expand,
          icon: const Center(
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
              MonsterInfo(monster: monster),
              MonsterPhysiology(monster: monster),
              MonsterQuest(monster: monster),
              MonsterDrop(monster: monster),
            ],
          ),
          child: TheTabBar(
            tabController: tabController,
            currentPage: currentPage,
            unselectedColor: unselectedColor,
            selectedColor: selectedColor,
          ),
        ),
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
    required this.selectedColor,
  }) : super(key: key);

  final TabController tabController;
  final int currentPage;
  final Color unselectedColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
      controller: tabController,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: selectedColor,
            width: 4,
          ),
          insets: const EdgeInsets.fromLTRB(16, 0, 16, 8)),
      tabs: [
        SizedBox(
          height: 55,
          width: 40,
          child: Center(
              child: Icon(
            Icons.catching_pokemon,
            color: currentPage == 0 ? selectedColor : unselectedColor,
          )),
        ),
        SizedBox(
          height: 55,
          width: 40,
          child: Center(
              child: Icon(
            Icons.accessibility,
            color: currentPage == 1 ? selectedColor : unselectedColor,
          )),
        ),
        SizedBox(
          height: 55,
          width: 40,
          child: Center(
              child: Icon(
            Icons.assignment,
            color: currentPage == 2 ? selectedColor : unselectedColor,
          )),
        ),
        SizedBox(
          height: 55,
          width: 40,
          child: Center(
              child: Icon(
            Icons.diamond,
            color: currentPage == 3 ? selectedColor : unselectedColor,
          )),
        ),
      ],
    );
  }
}
