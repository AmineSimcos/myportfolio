import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/animated_button.dart';
import '../widgets/language_switcher.dart';
import '../widgets/theme_switcher.dart';
import 'about_page.dart';
import 'projects_page.dart';
import 'certificates_page.dart';

class HomePage extends StatefulWidget {
  final Function(ThemeMode) changeTheme;
  final Function(Locale) changeLanguage;
  final ThemeMode currentTheme;
  final Locale currentLocale;

  const HomePage({
    super.key,
    required this.changeTheme,
    required this.changeLanguage,
    required this.currentTheme,
    required this.currentLocale,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final isArabic = widget.currentLocale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.portfolioTitle)
            .animate()
            .fadeIn(duration: 500.ms),
        actions: [
          ThemeSwitcher(
            currentTheme: widget.currentTheme,
            changeTheme: widget.changeTheme,
          ),
          LanguageSwitcher(
            currentLocale: widget.currentLocale,
            changeLanguage: widget.changeLanguage,
          ),
        ],
      ),
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          children: [
            // Section profil avec animation
            _buildProfileSection(context, localizations),

            // Onglets animés
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: localizations.about),
                Tab(text: localizations.projects),
                Tab(text: localizations.certificates),
              ],
            ).animate().slideX(duration: 600.ms, begin: 0.5),

            // Contenu des onglets
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  AboutPage(locale: widget.currentLocale),
                  ProjectsPage(locale: widget.currentLocale),
                  CertificatesPage(locale: widget.currentLocale),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(
      BuildContext context, AppLocalizations localizations) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // Photo de profil avec animation
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          )
              .animate()
              .scale(duration: 500.ms)
              .then(delay: 200.ms)
              .shake(duration: 300.ms),

          const SizedBox(width: 20),

          // Texte de présentation avec animation
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.welcomeMessage(''),
                  style: Theme.of(context).textTheme.headlineSmall,
                ).animate().fadeIn(duration: 500.ms),
                const SizedBox(height: 8),
                Text(
                  localizations.shortDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ).animate().fadeIn(duration: 700.ms),
                const SizedBox(height: 16),
                AnimatedButton(
                  text: localizations.contactMe,
                  onPressed: () {
                    // Action de contact
                  },
                ).animate().fadeIn(duration: 900.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
