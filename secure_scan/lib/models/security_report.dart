class SecurityReport {
  final String url;
  final String ipAddress;
  final String server;
  final String hostingProvider;
  final String country;

  final bool sslEnabled;
  final bool httpsEnabled;

  final int securityScore;

  final List<String> technologies;
  final List<String> securityHeaders;
  final List<int> openPorts;

  final bool secureCookies;
  final bool httpOnlyCookies;
  final bool sameSiteCookies;

  final DateTime scanTime;

  const SecurityReport({
    required this.url,
    required this.ipAddress,
    required this.server,
    required this.hostingProvider,
    required this.country,
    required this.sslEnabled,
    required this.httpsEnabled,
    required this.securityScore,
    required this.technologies,
    required this.securityHeaders,
    required this.openPorts,
    required this.secureCookies,
    required this.httpOnlyCookies,
    required this.sameSiteCookies,
    required this.scanTime,
  });

  bool get isSecure => securityScore >= 90;

  bool get needsAttention =>
      securityScore >= 70 && securityScore < 90;

  bool get isHighRisk => securityScore < 70;
}