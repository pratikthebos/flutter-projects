import 'package:flutter/material.dart';

class TimeSlot extends StatefulWidget {
  const TimeSlot({super.key});

  @override
  State<TimeSlot> createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  int selectedIndex = 5;

  final List<String> slots = [
    "06:00 AM",
    "07:00 AM",
    "08:00 AM",
    "09:00 AM",
    "10:00 AM",
    "06:00 PM",
    "07:00 PM",
    "08:00 PM",
    "09:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(
        slots.length,
            (index) {
          final selected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                gradient: selected
                    ? const LinearGradient(
                  colors: [
                    Color(0xff2563EB),
                    Color(0xff06B6D4),
                  ],
                )
                    : null,
                color: selected ? null : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: selected
                      ? Colors.transparent
                      : Colors.grey.shade300,
                ),
                boxShadow: [
                  BoxShadow(
                    color: selected
                        ? Colors.blue.withOpacity(.25)
                        : Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: 18,
                    color:
                    selected ? Colors.white : Colors.grey.shade700,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    slots[index],
                    style: TextStyle(
                      color:
                      selected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}