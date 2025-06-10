import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSwitcher extends StatelessWidget {
  final Locale currentLocale;
  final Function(Locale) changeLanguage;

  const LanguageSwitcher({
    super.key,
    required this.currentLocale,
    required this.changeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: changeLanguage,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: const Locale('en'),
          child: Text(localizations.english),
        ),
        PopupMenuItem(
          value: const Locale('fr'),
          child: Text(localizations.french),
        ),
        PopupMenuItem(
          value: const Locale('es'),
          child: Text(localizations.spanish),
        ),
        PopupMenuItem(
          value: const Locale('ar'),
          child: Text(localizations.arabic),
        ),
      ],
    );
  }
}