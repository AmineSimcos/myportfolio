class Project {
  final String title;
  final String description;
  final String imagePath;
  final List<String> tags;
  final String? link;

  Project({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.tags,
    this.link,
  });

  static List<Project> sampleProjects(AppLocalizations localizations) {
    return [
      Project(
        title: localizations.project1Title,
        description: localizations.project1Description,
        imagePath: 'assets/images/projects/project1.jpg',
        tags: ['Flutter', 'Dart', 'Firebase'],
      ),
      Project(
        title: localizations.project2Title,
        description: localizations.project2Description,
        imagePath: 'assets/images/projects/project2.jpg',
        tags: ['UI/UX', 'Figma'],
      ),
      // Ajouter d'autres projets...
    ];
  }
}