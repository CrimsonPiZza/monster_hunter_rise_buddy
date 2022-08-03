import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/page/home/widget/custom_app_bar.dart';
import 'package:mhr_buddy/src/page/home/widget/menu_items.dart';
import 'package:mhr_buddy/src/settings/settings_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          CustomAppBar(settingsController: settingsController),
          const MenuItems()
        ],
      ),
    );
  }
}
