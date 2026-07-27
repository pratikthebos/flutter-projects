import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_icons.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/weather_background.dart';
import '../../viewmodels/forecast_viewmodel.dart';

import '../../widgets/ai_prediction_card.dart';
import '../../widgets/forecast_chip.dart';
import '../../widgets/weekly_card.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ForecastViewModel>(context);

    return Scaffold(
      body: WeatherBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [

              const CustomAppBar(),

              const SizedBox(height: 30),

              const Text(
                "AI Weather Prediction",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Next 7 Days Forecast",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 30),

              /// AI Prediction Cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: vm.predictions.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 1.25,
                ),
                itemBuilder: (context, index) {
                  final item = vm.predictions[index];

                  return AiPredictionCard(
                    title: item.title,
                    value: item.value,
                  );
                },
              ),

              const SizedBox(height: 35),

              const SectionTitle(
                title: "Weekly Forecast",
              ),

              const SizedBox(height: 20),

              /// Forecast Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [

                    ForecastChip(
                      text: "7 Days",
                      selected: true,
                    ),

                    ForecastChip(text: "15 Days"),

                    ForecastChip(text: "30 Days"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// Weekly Cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: vm.weekly.length,
                itemBuilder: (context, index) {
                  return WeeklyCard(
                    weather: vm.weekly[index],
                  );
                },
              ),

              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Row(
                  children: [

                    Icon(
                      AppIcons.ai,
                      color: Colors.amber,
                      size: 40,
                    ),

                    SizedBox(width: 18),

                    Expanded(
                      child: Text(
                        "AI predicts light rainfall on Wednesday evening. Carry an umbrella while travelling.",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }
}