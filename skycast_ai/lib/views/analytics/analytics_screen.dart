import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/weather_background.dart';
import '../../viewmodels/analytics_viewmodel.dart';

import '../../widgets/temperature_chart.dart';
import '../../widgets/humidity_chart.dart';
import '../../widgets/rainfall_chart.dart';
import '../../widgets/wind_card.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AnalyticsViewModel>(context);

    return Scaffold(
      body: WeatherBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [

              const CustomAppBar(),

              const SizedBox(height: 30),

              const Text(
                "Weather Analytics",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Detailed Weekly Weather Statistics",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Temperature",
              ),

              const SizedBox(height: 18),

              TemperatureChart(
                data: vm.temperature,
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Humidity",
              ),

              const SizedBox(height: 18),

              HumidityChart(
                data: vm.humidity,
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Rainfall",
              ),

              const SizedBox(height: 18),

              RainfallChart(
                data: vm.rainfall,
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Wind Information",
              ),

              const SizedBox(height: 18),

              WindCard(
                speed: vm.wind.last,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}