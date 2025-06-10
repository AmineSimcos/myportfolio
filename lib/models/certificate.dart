class Certificate {
  final String title;
  final String organization;
  final String date;
  final String imagePath;
  final String? credentialId;

  Certificate({
    required this.title,
    required this.organization,
    required this.date,
    required this.imagePath,
    this.credentialId,
  });

  static List<Certificate> sampleCertificates(AppLocalizations localizations) {
    return [
      Certificate(
        title: localizations.certificate1Title,
        organization: 'Google',
        date: '2023',
        imagePath: 'assets/images/certificates/cert1.jpg'),
      Certificate(
        title: localizations.certificate2Title,
        organization: 'Microsoft',
        date: '2022',
        imagePath: 'assets/images/certificates/cert2.jpg'),
      // Ajouter d'autres certificats...
    ];
  }
}