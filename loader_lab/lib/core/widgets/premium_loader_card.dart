import 'package:flutter/material.dart';

import '../../models/loader_model.dart';
import 'glass_card.dart';

class PremiumLoaderCard extends StatelessWidget {
  final LoaderModel loader;
  final Widget preview;

  const PremiumLoaderCard({
    super.key,
    required this.loader,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xff6C63FF)
                        .withOpacity(.10),
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                  child: Icon(
                    loader.icon,
                    color: const Color(0xff6C63FF),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        loader.title,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff172033),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        loader.category,
                        style: const TextStyle(
                          color: Color(0xff6C63FF),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffF4F1FF),
                    Color(0xffEEF8FF),
                  ],
                ),
              ),
              child: Center(
                child: preview,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              loader.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xff687386),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}