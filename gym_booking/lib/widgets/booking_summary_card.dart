import 'package:flutter/material.dart';

class BookingSummaryCard extends StatelessWidget {
  const BookingSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: const [
              Icon(
                Icons.receipt_long_rounded,
                color: Color(0xff2563EB),
              ),
              SizedBox(width: 10),
              Text(
                "Booking Summary",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          const _SummaryRow(
            icon: Icons.calendar_today,
            title: "Date",
            value: "Today, 23 July",
          ),

          const Divider(height: 28),

          const _SummaryRow(
            icon: Icons.access_time_filled,
            title: "Time",
            value: "07:00 PM",
          ),

          const Divider(height: 28),

          const _SummaryRow(
            icon: Icons.fitness_center,
            title: "Workout",
            value: "Chest & Triceps",
          ),

          const Divider(height: 28),

          const _SummaryRow(
            icon: Icons.person,
            title: "Trainer",
            value: "John Carter",
          ),

          const Divider(height: 28),

          const _SummaryRow(
            icon: Icons.timer,
            title: "Duration",
            value: "65 Minutes",
          ),

          const Divider(height: 28),

          const _SummaryRow(
            icon: Icons.local_fire_department,
            title: "Calories",
            value: "~640 kcal",
          ),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [

                Row(
                  children: const [
                    Text(
                      "Session Fee",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      "\$25",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: const [
                    Text(
                      "Membership Discount",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      "-\$5",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Divider(),
                ),

                Row(
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$20",
                      style: TextStyle(
                        color: Color(0xff2563EB),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: const [

                Icon(
                  Icons.verified,
                  color: Colors.blue,
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Text(
                    "AI has reserved your preferred workout slot. Your trainer will be notified immediately after confirmation.",
                    style: TextStyle(
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _SummaryRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xffEEF4FF),
          child: Icon(
            icon,
            color: const Color(0xff2563EB),
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}