import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gym_booking/widgets/ai_booking_card.dart';
import 'package:gym_booking/widgets/booking_summary_card.dart';
import 'package:gym_booking/widgets/calendar_strip.dart';
import 'package:gym_booking/widgets/time_slot.dart';
import 'package:gym_booking/widgets/trainer_selector.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FC),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Book Workout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// AI Recommendation
            const AiBookingCard()
                .animate()
                .fade(duration: 500.ms)
                .slideY(begin: .3),

            const SizedBox(height: 25),

            /// Date
            const Text(
              "Select Date",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            const CalendarStrip()
                .animate()
                .fade(delay: 200.ms)
                .slideX(begin: .2),

            const SizedBox(height: 30),

            /// Time
            const Text(
              "Available Time",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            const TimeSlot()
                .animate()
                .fade(delay: 400.ms),

            const SizedBox(height: 30),

            /// Trainer
            const Text(
              "Choose Trainer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            const TrainerSelector()
                .animate()
                .fade(delay: 600.ms)
                .slideY(begin: .2),

            const SizedBox(height: 30),

            /// Summary
            const BookingSummaryCard()
                .animate()
                .fade(delay: 800.ms),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  "Confirm Booking",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ).animate().scale(delay: 1000.ms),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}