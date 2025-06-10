import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeSwitcher extends StatelessWidget {
  final ThemeMode currentTheme;
  final Function(ThemeMode) changeTheme;

  const ThemeSwitcher({
    super.key,
    required this.currentTheme,
    required this.changeTheme,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return PopupMenuButton<ThemeMode>(
      icon: Icon(
        currentTheme == ThemeMode.dark
            ? Icons.dark_mode
            : currentTheme == ThemeMode.light
                ? Icons.light_mode
                : Icons.brightness_auto,
      ),
      onSelected: changeTheme,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: ThemeMode.light,
          child: Text(localizations.lightTheme),
        ),
        PopupMenuItem(
          value: ThemeMode.dark,
          child: Text(localizations.darkTheme),
        ),
        PopupMenuItem(
          value: ThemeMode.system,
          child: Text(localizations.systemTheme),
        ),
      ],
    );
  }
}