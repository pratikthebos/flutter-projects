import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class DashboardCard extends StatelessWidget {

  final IconData icon;

  final String title;

  final String subtitle;

  final Gradient gradient;

  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(

      borderRadius: BorderRadius.circular(24),

      onTap: onTap,

      child: Container(

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(24),

          boxShadow: const [

            BoxShadow(

              color: AppColors.shadow,

              blurRadius: 12,

              offset: Offset(0,5),

            ),

          ],

        ),

        child: Column(

          children: [

            Container(

              height: 90,

              decoration: BoxDecoration(

                gradient: gradient,

                borderRadius: const BorderRadius.vertical(

                  top: Radius.circular(24),

                ),

              ),

              child: Center(

                child: Icon(

                  icon,

                  color: Colors.white,

                  size: 42,

                ),

              ),

            ),

            Expanded(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(

                      title,

                      textAlign: TextAlign.center,

                      style: const TextStyle(

                        fontWeight: FontWeight.bold,

                        fontSize: 17,

                      ),

                    ),

                    const SizedBox(height: 6),

                    Text(

                      subtitle,

                      textAlign: TextAlign.center,

                      style: const TextStyle(

                        color: AppColors.textSecondary,

                        fontSize: 13,

                      ),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}