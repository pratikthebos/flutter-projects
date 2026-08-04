import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class JarvisConsole extends StatelessWidget {

  final List<String> logs;

  const JarvisConsole({
    super.key,
    required this.logs,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: AppColors.card,

        borderRadius: BorderRadius.circular(25),

        border: Border.all(
          color: Colors.cyanAccent.withOpacity(.25),
        ),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Row(

            children: [

              Icon(
                Icons.memory,
                color: Colors.cyanAccent,
              ),

              SizedBox(width: 10),

              Text(

                "JARVIS AI",

                style: TextStyle(

                  color: Colors.white,

                  fontWeight: FontWeight.bold,

                  fontSize: 20,

                ),

              ),

            ],

          ),

          const SizedBox(height: 20),

          ...logs.map(

                (e) => Padding(

              padding: const EdgeInsets.only(bottom: 12),

              child: Row(

                children: [

                  const Icon(

                    Icons.check_circle,

                    color: Colors.greenAccent,

                    size: 18,

                  ),

                  const SizedBox(width: 10),

                  Expanded(

                    child: Text(

                      e,

                      style: const TextStyle(

                        color: Colors.white70,

                        fontSize: 15,

                      ),

                    ),

                  ),

                ],

              ),

            ),

          ),

        ],

      ),

    );

  }

}