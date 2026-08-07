import 'dart:ui';

import 'package:flutter/material.dart';

class FloatingInfo extends StatelessWidget {

  final String title;

  final String subtitle;

  const FloatingInfo({

    super.key,

    required this.title,

    required this.subtitle,

  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

      borderRadius:
      BorderRadius.circular(20),

      child: BackdropFilter(

        filter: ImageFilter.blur(

          sigmaX: 18,

          sigmaY: 18,

        ),

        child: Container(

          padding:
          const EdgeInsets.all(18),

          decoration: BoxDecoration(

            color: Colors.white
                .withOpacity(.72),

            borderRadius:
            BorderRadius.circular(20),

          ),

          child: Column(

            mainAxisSize:
            MainAxisSize.min,

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(

                title,

                style: const TextStyle(

                  fontWeight:
                  FontWeight.bold,

                  fontSize: 22,

                ),

              ),

              const SizedBox(height: 6),

              Text(

                subtitle,

                style: const TextStyle(

                  color: Colors.black54,

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}