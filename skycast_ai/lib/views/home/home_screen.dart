import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_icons.dart';
import '../../core/widgets/animated_cloud.dart';
import '../../core/widgets/animated_sun.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/weather_background.dart';
import '../../viewmodels/home_viewmodel.dart';

import '../../widgets/hourly_card.dart';
import '../../widgets/weather_card.dart';
import '../../widgets/weather_stat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

    final weather = vm.weather;

    return Scaffold(
      body: WeatherBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [

              /// App Bar
              const CustomAppBar(),

              const SizedBox(height: 30),

              /// Weather Card
              GlassCard(
                child: Column(
                  children: [

                    const AnimatedSun(),

                    const SizedBox(height: 15),

                    Text(
                      "${weather.temperature}°",
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      weather.condition,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      "Feels Like ${weather.feelsLike}°",
                      style: const TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Today's Highlights",
              ),

              const SizedBox(height: 18),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
                children: [

                  WeatherStatCard(
                    icon: AppIcons.humidity,
                    title: "Humidity",
                    value: "${weather.humidity}%",
                    color: Colors.lightBlue,
                  ),

                  WeatherStatCard(
                    icon: AppIcons.wind,
                    title: "Wind",
                    value: "${weather.windSpeed} km/h",
                    color: Colors.green,
                  ),

                  WeatherStatCard(
                    icon: AppIcons.uv,
                    title: "UV Index",
                    value: "${weather.uvIndex}",
                    color: Colors.orange,
                  ),

                  WeatherStatCard(
                    icon: AppIcons.airQuality,
                    title: "AQI",
                    value: "${weather.airQuality}",
                    color: Colors.purple,
                  ),

                ],
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Hourly Forecast",
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vm.hourly.length,
                  itemBuilder: (context, index) {
                    return HourlyCard(
                      weather: vm.hourly[index],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Sunrise & Sunset",
              ),

              const SizedBox(height: 18),

              Row(
                children: [

                  Expanded(
                    child: WeatherCard(
                      icon: AppIcons.sunrise,
                      title: "Sunrise",
                      value: weather.sunrise,
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: WeatherCard(
                      icon: AppIcons.sunset,
                      title: "Sunset",
                      value: weather.sunset,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 30),

              const AnimatedCloud(),

              const SizedBox(height: 50),

            ],
          ),
        ),
      ),
    );
  }
}