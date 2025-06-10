import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/project.dart';

class ProjectsPage extends StatelessWidget {
  final Locale locale;

  const ProjectsPage({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final projects = Project.sampleProjects(localizations);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            localizations.myProjects,
            style: Theme.of(context).textTheme.headlineMedium,
          ).animate().fadeIn(duration: 300.ms),
          const SizedBox(height: 30),
          
          // Grille de projets animée
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return _buildProjectCard(context, projects[index])
                  .animate(delay: (100 * index).ms)
                  .slideY(begin: 0.5)
                  .fadeIn();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Project project) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(project.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  project.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: project.tags
                      .map((tag) => Chip(
                            label: Text(tag),
                            visualDensity: VisualDensity.compact,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}