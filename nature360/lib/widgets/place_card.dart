import 'package:flutter/material.dart';

import '../core/models/place_model.dart';
import '../core/widgets/glass_card.dart';

class PlaceCard extends StatelessWidget {
  final PlaceModel place;
  final VoidCallback onTap;

  const PlaceCard({
    super.key,
    required this.place,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: GlassCard(
        height: 320,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            //------------------------------------------
            // Image
            //------------------------------------------

            SizedBox(
              height: 170,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                child: Image.asset(
                  place.image,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.blue.shade100,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.blueGrey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            //------------------------------------------
            // Details
            //------------------------------------------

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff263238),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      place.subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.panorama,
                                color: Colors.blue,
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "360° Panorama",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        ),
    );
  }
}