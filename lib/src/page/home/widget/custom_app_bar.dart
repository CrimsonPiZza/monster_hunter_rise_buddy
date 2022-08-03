import 'package:flutter/material.dart';
import 'package:mhr_buddy/src/settings/settings_controller.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.8,
                color: Colors.black,
                spreadRadius: 0.3,
                offset: Offset(-0.5, 0.5),
              )
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).backgroundColor,
            foregroundImage: const NetworkImage(
                'https://www.monsterhunter.com/rise-sunbreak/assets/img/logo-sb-l.png'),
          ),
        ),
        title: const Text(
          'Monster Hunter Rise\'s Buddy',
          style: TextStyle(fontSize: 16),
        ),
        subtitle: const Text('Your Personal MHR Guide',
            style: TextStyle(fontSize: 10)),
        trailing: IconButton(
            onPressed: () {
              settingsController.updateThemeMode(
                  settingsController.themeMode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light);
            },
            icon: Icon(settingsController.themeMode == ThemeMode.light
                ? Icons.dark_mode_rounded
                : Icons.light_mode_rounded)),
      ),
    );
  }
}
