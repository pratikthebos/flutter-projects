import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/security_report.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_card.dart';
import '../widgets/score_ring.dart';

class ReportScreen extends StatelessWidget {
  final SecurityReport report;

  const ReportScreen({
    super.key,
    required this.report,
  });

  Widget statusTile({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: GlassCard(
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 34,
            ),
            const SizedBox(height: 15),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white60,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chip(String text, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withOpacity(.5)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Security Report",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 30),

                Center(
                  child: Hero(
                    tag: "shield",
                    child: const ScoreRing(
                      score: 96,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Website Information",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 20),

                      infoTile("Website", report.url),
                      infoTile("IP Address", report.ipAddress),
                      infoTile("Server", report.server),
                      infoTile("Hosting", report.hostingProvider),
                      infoTile("Country", report.country),
                      infoTile(
                        "Scanned",
                        DateFormat("dd MMM yyyy  hh:mm a")
                            .format(report.scanTime),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  children: [
                    statusTile(
                      title: "SSL",
                      value: report.sslEnabled ? "Enabled" : "Disabled",
                      icon: Icons.verified_user,
                      color: report.sslEnabled
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 15),
                    statusTile(
                      title: "HTTPS",
                      value:
                      report.httpsEnabled ? "Enabled" : "Disabled",
                      icon: Icons.lock,
                      color: report.httpsEnabled
                          ? Colors.green
                          : Colors.red,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Detected Technologies",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Wrap(
                        children: report.technologies
                            .map(
                              (e) => chip(
                            e,
                            Colors.blueAccent,
                          ),
                        )
                            .toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Security Headers",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Wrap(
                        children: report.securityHeaders
                            .map(
                              (e) => chip(
                            e,
                            Colors.green,
                          ),
                        )
                            .toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Open Ports",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Wrap(
                        children: report.openPorts
                            .map(
                              (e) => chip(
                            e.toString(),
                            Colors.orange,
                          ),
                        )
                            .toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Cookie Security",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      infoTile(
                        "Secure",
                        report.secureCookies ? "Yes" : "No",
                      ),

                      infoTile(
                        "HttpOnly",
                        report.httpOnlyCookies ? "Yes" : "No",
                      ),

                      infoTile(
                        "SameSite",
                        report.sameSiteCookies ? "Yes" : "No",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}