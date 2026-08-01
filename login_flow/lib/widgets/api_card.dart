import 'package:flutter/material.dart';

class ApiCard extends StatefulWidget {
  const ApiCard({super.key});

  @override
  State<ApiCard> createState() => _ApiCardState();
}

class _ApiCardState extends State<ApiCard>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "2. HTTP POST Request",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 20),

            const Text("POST /api/v1/login"),

            const SizedBox(height: 10),

            const Text("{"),
            const Text('   "username":"student",'),
            const Text('   "password":"123456"'),
            const Text("}"),

            const SizedBox(height: 15),

            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: controller.value,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(10),
                );
              },
            ),

            const SizedBox(height: 12),

            if (controller.isCompleted)
              const Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Request Created Successfully",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}