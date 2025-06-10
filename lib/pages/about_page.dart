import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutPage extends StatelessWidget {
  final Locale locale;

  const AboutPage({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final isArabic = locale.languageCode == 'ar';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.aboutTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ).animate().fadeIn(duration: 300.ms),
          const SizedBox(height: 20),
          Text(
            localizations.aboutContent,
            textAlign: isArabic ? TextAlign.right : TextAlign.left,
            style: Theme.of(context).textTheme.bodyLarge,
          ).animate().fadeIn(duration: 500.ms),
          const SizedBox(height: 30),
          
          // Compétences avec animations en cascade
          Text(
            localizations.skillsTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ).animate().fadeIn(duration: 700.ms),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(10, (index) {
              return Chip(
                label: Text('Compétence ${index + 1}'),
              )
                  .animate(delay: (100 * index).ms)
                  .slideX(begin: 0.5)
                  .fadeIn();
            }),
          ),
        ],
      ),
    );
  }
}