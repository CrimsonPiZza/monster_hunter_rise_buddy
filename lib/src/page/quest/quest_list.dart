import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mhr_buddy/src/data/game_data.dart';
import 'package:mhr_buddy/src/model/quest.dart';
import 'package:mhr_buddy/src/page/quest/widget/quest_list_view.dart';

class QuestList extends StatefulWidget {
  const QuestList({Key? key}) : super(key: key);

  static const routeName = '/quest';

  @override
  State<QuestList> createState() => _QuestListState();
}

class _QuestListState extends State<QuestList> {
  final filterOptions = [
    'No Filter',
    'Event Quest',
    'Anomaly Quest',
    'Follower quest',
    'Hub Quest: Master Rank',
    'Hub Quest: High Rank',
    'Hub Quest: Low Rank',
    'Village Quest',
    'Arena Quest',
    'Training Quest',
  ];
  late String _selectedFilterOption;
  late List<Quest> filteredQuests;
  late String _searchString = '';

  late ScrollController listViewController;

  @override
  void initState() {
    _selectedFilterOption = filterOptions[0];
    listViewController = ScrollController();
    filter();
    super.initState();
  }

  void filter() {
    if (_selectedFilterOption == filterOptions[0]) {
      setState(() {
        // NO FILTER
        filteredQuests = GameData.quests;
        filteredQuests.sort((a, b) => b.name.compareTo(a.name));
      });
    } else {
      setState(() {
        //
        filteredQuests = GameData.quests
            .where((quest) => quest.questType == _selectedFilterOption)
            .toList();
      });
    }
  }

  void changeFilter(str) {
    _selectedFilterOption = str;

    filter();
    search();
  }

  void changeSearchString(String str) {
    _searchString = str;

    search();
  }

  void search() {
    if (_searchString.isEmpty) return filter();

    filter();
    setState(() {
      filteredQuests = filteredQuests
          .where((quest) =>
              quest.name.toLowerCase().contains(_searchString.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: toolsFAB(context),
      body: QuestListView(
        quests: filteredQuests,
        controller: listViewController,
      ),
    );
  }

  SpeedDial toolsFAB(BuildContext context) {
    return SpeedDial(
      icon: Icons.settings,
      activeIcon: Icons.close,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.onBackground,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.search),
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.onBackground,
          label: 'Search',
          onTap: () => {
            showDialog(
              context: context,
              builder: (_) => Dialog(
                backgroundColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: SizedBox(
                      height: 46,
                      child: TextField(
                        controller: TextEditingController()
                          ..text = _searchString,
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 1,
                        minLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        onChanged: (value) {
                          changeSearchString(value);
                        },
                        onSubmitted: (value) =>
                            Navigator.of(context).pop(false),
                        decoration: InputDecoration(
                          suffixIconColor:
                              Theme.of(context).colorScheme.onBackground,
                          suffixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.all(16),
                          hintStyle: Theme.of(context).textTheme.subtitle2,
                          hintText: 'Search...',
                          border: InputBorder.none,
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          },
        ),
        SpeedDialChild(
          key: const Key('filter_speed_dial'),
          child: const Icon(Icons.filter_alt_rounded),
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.onBackground,
          label: 'Filter',
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => filterDialog(context),
            );
          },
        ),
        SpeedDialChild(
          key: const Key('to_top_speed_dial'),
          child: const Icon(Icons.arrow_upward_rounded),
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.onBackground,
          label: 'To Top',
          onTap: () {
            // Scroll Quest List View to top
            listViewController.animateTo(
              0,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }

  Dialog filterDialog(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: filterOptions
            .map(
              (option) => ListTile(
                title: Text(option),
                onTap: () async {
                  changeFilter(option);
                  Navigator.of(context).pop(false);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
