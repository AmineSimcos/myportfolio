import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/certificate.dart';

class CertificatesPage extends StatelessWidget {
  final Locale locale;

  const CertificatesPage({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final certificates = Certificate.sampleCertificates(localizations);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            localizations.myCertificates,
            style: Theme.of(context).textTheme.headlineMedium,
          ).animate().fadeIn(duration: 300.ms),
          const SizedBox(height: 30),
          
          // Liste de certificats animée
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: certificates.length,
            itemBuilder: (context, index) {
              return _buildCertificateItem(context, certificates[index])
                  .animate(delay: (100 * index).ms)
                  .slideX(begin: 0.5)
                  .fadeIn();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateItem(BuildContext context, Certificate certificate) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(certificate.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificate.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    certificate.organization,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    certificate.date,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}