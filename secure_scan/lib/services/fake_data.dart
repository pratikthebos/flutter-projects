import '../models/security_report.dart';

class FakeData {
  FakeData._();

  static SecurityReport generateReport(String url) {
    return SecurityReport(
      url: url,

      ipAddress: "142.250.183.206",

      server: "Google Frontend",

      hostingProvider: "Google Cloud",

      country: "United States",

      sslEnabled: true,

      httpsEnabled: true,

      securityScore: 96,

      technologies: const [
        "Flutter Web",
        "Nginx",
        "HTTP/2",
        "Cloudflare",
        "Dart",
        "Firebase",
      ],

      securityHeaders: const [
        "Strict-Transport-Security",
        "Content-Security-Policy",
        "X-Frame-Options",
        "X-Content-Type-Options",
        "Referrer-Policy",
        "Permissions-Policy",
      ],

      openPorts: const [
        80,
        443,
      ],

      secureCookies: true,

      httpOnlyCookies: true,

      sameSiteCookies: true,

      scanTime: DateTime.now(),
    );
  }

  static final recentScans = [
    "https://google.com",
    "https://github.com",
    "https://flutter.dev",
    "https://openai.com",
    "https://amazon.com",
    "https://microsoft.com",
  ];
}