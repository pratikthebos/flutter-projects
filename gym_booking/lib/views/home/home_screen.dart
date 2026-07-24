import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/section_title.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/ai_card.dart';
import '../../widgets/booking_card.dart';
import '../../widgets/stats_card.dart';
import '../../widgets/trainer_card.dart';
import '../../widgets/workout_card.dart';
import '../booking/booking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xffF6F8FC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              CustomAppBar(
                name: vm.user.name,
              ).animate().fade().slideY(),

              const SizedBox(height: 25),

              const AiCard()
                  .animate()
                  .fade(delay: 200.ms)
                  .slideY(),

              const SizedBox(height: 20),

              BookingCard(
                date: vm.booking.date,
                time: vm.booking.time,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BookingScreen(),
                    ),
                  );
                },
              ).animate().fade(delay: 300.ms),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Today's Stats",
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    StatsCard(
                      icon: Icons.local_fire_department,
                      title: "Calories",
                      value: "${vm.user.calories}",
                      color: Colors.orange,
                    ),

                    const SizedBox(width: 15),

                    StatsCard(
                      icon: Icons.timer,
                      title: "Workout",
                      value: "${vm.user.workoutMinutes} min",
                      color: Colors.blue,
                    ),

                    const SizedBox(width: 15),

                    StatsCard(
                      icon: Icons.favorite,
                      title: "Heart Rate",
                      value: "124 bpm",
                      color: Colors.red,
                    ),

                    const SizedBox(width: 15),

                    StatsCard(
                      icon: Icons.monitor_weight,
                      title: "Weight",
                      value: "72 kg",
                      color: Colors.green,
                    ),

                    const SizedBox(width: 15),

                    StatsCard(
                      icon: Icons.speed,
                      title: "BMI",
                      value: "${vm.user.bmi}",
                      color: Colors.purple,
                    ),

                    const SizedBox(width: 15),

                    StatsCard(
                      icon: Icons.directions_walk,
                      title: "Steps",
                      value: "12.5K",
                      color: Colors.teal,
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Your Trainer",
              ),

              const SizedBox(height: 15),

              TrainerCard(
                trainer: vm.trainer,
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Today's Workout",
              ),

              const SizedBox(height: 15),

              ...vm.workouts.map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: WorkoutCard(
                    workout: e,
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