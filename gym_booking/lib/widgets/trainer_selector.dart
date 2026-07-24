import 'package:flutter/material.dart';

class TrainerSelector extends StatefulWidget {
  const TrainerSelector({super.key});

  @override
  State<TrainerSelector> createState() => _TrainerSelectorState();
}

class _TrainerSelectorState extends State<TrainerSelector> {
  int selectedTrainer = 0;

  final List<Map<String, dynamic>> trainers = [
    {
      "name": "John Carter",
      "speciality": "Strength Coach",
      "rating": "4.9",
      "experience": "8 Years",
      "price": "\$25",
      "available": true,
      "image":
      "https://i.pravatar.cc/300?img=12",
    },
    {
      "name": "Sarah Wilson",
      "speciality": "Yoga Trainer",
      "rating": "4.8",
      "experience": "6 Years",
      "price": "\$20",
      "available": true,
      "image":
      "https://i.pravatar.cc/300?img=47",
    },
    {
      "name": "Michael Lee",
      "speciality": "CrossFit Coach",
      "rating": "4.9",
      "experience": "10 Years",
      "price": "\$30",
      "available": false,
      "image":
      "https://i.pravatar.cc/300?img=69",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        trainers.length,
            (index) {
          final trainer = trainers[index];
          final selected = selectedTrainer == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTrainer = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: selected
                      ? const Color(0xff2563EB)
                      : Colors.grey.shade300,
                  width: selected ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: selected
                        ? Colors.blue.withOpacity(.18)
                        : Colors.black12,
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Row(
                children: [

                  Hero(
                    tag: trainer["name"],
                    child: CircleAvatar(
                      radius: 34,
                      backgroundImage:
                      NetworkImage(trainer["image"]),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          trainer["name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          trainer["speciality"],
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [

                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),

                            const SizedBox(width: 4),

                            Text(trainer["rating"]),

                            const SizedBox(width: 18),

                            const Icon(
                              Icons.workspace_premium,
                              size: 18,
                              color: Colors.green,
                            ),

                            const SizedBox(width: 4),

                            Text(trainer["experience"]),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [

                            Container(
                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: trainer["available"]
                                    ? Colors.green.shade50
                                    : Colors.red.shade50,
                                borderRadius:
                                BorderRadius.circular(30),
                              ),
                              child: Text(
                                trainer["available"]
                                    ? "Available"
                                    : "Busy",
                                style: TextStyle(
                                  color: trainer["available"]
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const Spacer(),

                            Text(
                              trainer["price"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2563EB),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  AnimatedContainer(
                    duration:
                    const Duration(milliseconds: 300),
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? const Color(0xff2563EB)
                          : Colors.transparent,
                      border: Border.all(
                        color: selected
                            ? const Color(0xff2563EB)
                            : Colors.grey,
                      ),
                    ),
                    child: selected
                        ? const Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.white,
                    )
                        : null,
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