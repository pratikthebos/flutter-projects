import 'package:flutter/material.dart';

class CalendarStrip extends StatefulWidget {
  const CalendarStrip({super.key});

  @override
  State<CalendarStrip> createState() => _CalendarStripState();
}

class _CalendarStripState extends State<CalendarStrip> {
  int selectedIndex = 0;

  final List<Map<String, String>> dates = [
    {"day": "Today", "date": "23"},
    {"day": "Thu", "date": "24"},
    {"day": "Fri", "date": "25"},
    {"day": "Sat", "date": "26"},
    {"day": "Sun", "date": "27"},
    {"day": "Mon", "date": "28"},
    {"day": "Tue", "date": "29"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final selected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: selected
                    ? const LinearGradient(
                  colors: [
                    Color(0xff2563EB),
                    Color(0xff06B6D4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : null,
                color: selected ? null : Colors.white,
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
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    dates[index]["date"]!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: selected
                          ? Colors.white
                          : Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    dates[index]["day"]!,
                    style: TextStyle(
                      color: selected
                          ? Colors.white70
                          : Colors.grey,
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