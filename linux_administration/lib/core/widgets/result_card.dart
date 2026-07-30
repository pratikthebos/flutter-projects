import 'package:flutter/material.dart';

import '../../models/result_model.dart';
import '../constants/app_colors.dart';

class ResultCard extends StatelessWidget {

  final ResultModel result;

  const ResultCard({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [

          BoxShadow(

            color: AppColors.shadow,

            blurRadius: 10,

          )

        ],

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(

            children: [

              Container(

                width: 60,

                height: 60,

                decoration: const BoxDecoration(

                  color: AppColors.success,

                  shape: BoxShape.circle,

                ),

                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 35,
                ),

              ),

              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      result.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      result.status,
                      style: const TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),

          const SizedBox(height: 25),

          Text(
            result.details,
            style: const TextStyle(
              height: 1.7,
              fontSize: 16,
            ),
          ),

        ],
      ),

    );

  }

}