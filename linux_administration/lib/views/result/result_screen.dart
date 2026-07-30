import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/result_card.dart';
import '../../models/module_model.dart';
import '../../repositories/linux_repository.dart';
import '../../viewmodels/result_viewmodel.dart';

import '../../widgets/system_stat_card.dart';
import '../../widgets/progress_stat.dart';
import '../../widgets/health_card.dart';

class ResultScreen extends StatelessWidget {
  final ModuleModel module;

  const ResultScreen({
    super.key,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    final repository = LinuxRepository();
    final result = repository.getResult(module);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Execution Result"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          ResultCard(result: result),

          const SizedBox(height: 25),

          Row(
            children: [

              Expanded(
                child: ProgressStat(
                  title: "Health",
                  percent: .98,
                  color: AppColors.success,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: ProgressStat(
                  title: "Security",
                  percent: .96,
                  color: AppColors.info,
                ),
              ),

            ],
          ),

          const SizedBox(height: 25),

          const HealthCard(),

          const SizedBox(height: 25),

          const Text(
            "System Statistics",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const Row(
            children: [

              Expanded(
                child: SystemStatCard(
                  title: "CPU",
                  value: "18%",
                  color: AppColors.cpu,
                  icon: Icons.memory,
                ),
              ),

              SizedBox(width: 15),

              Expanded(
                child: SystemStatCard(
                  title: "RAM",
                  value: "6.2 GB",
                  color: AppColors.memory,
                  icon: Icons.sd_storage,
                ),
              ),

            ],
          ),

          const SizedBox(height: 15),

          const Row(
            children: [

              Expanded(
                child: SystemStatCard(
                  title: "Disk",
                  value: "39%",
                  color: AppColors.disk,
                  icon: Icons.storage,
                ),
              ),

              SizedBox(width: 15),

              Expanded(
                child: SystemStatCard(
                  title: "Network",
                  value: "12 ms",
                  color: AppColors.network,
                  icon: Icons.wifi,
                ),
              ),

            ],
          ),

          const SizedBox(height: 35),

          SizedBox(
            height: 56,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {

                Navigator.popUntil(
                  context,
                      (route) => route.isFirst,
                );

              },
              icon: const Icon(Icons.home,color: Colors.white,),
              label: const Text(
                "Back To Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}