import 'package:flutter/material.dart';

import '../../app/routes.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rooms = [

      {
        "title": "Living Room",
        "icon": Icons.weekend,
        "colors": [Color(0xff00C6FF), Color(0xff0072FF)],
      },

      {
        "title": "Bedroom",
        "icon": Icons.bed,
        "colors": [Color(0xff8E2DE2), Color(0xff4A00E0)],
      },

      {
        "title": "Kitchen",
        "icon": Icons.kitchen,
        "colors": [Color(0xffFF9966), Color(0xffFF5E62)],
      },

      {
        "title": "Office",
        "icon": Icons.computer,
        "colors": [Color(0xff00B09B), Color(0xff96C93D)],
      },

      {
        "title": "Dining Room",
        "icon": Icons.table_restaurant,
        "colors": [Color(0xffF7971E), Color(0xffFFD200)],
      },

      {
        "title": "Bathroom",
        "icon": Icons.bathtub,
        "colors": [Color(0xff56CCF2), Color(0xff2F80ED)],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff040B17),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Choose Your Room",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(20),

        itemCount: rooms.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: .82,
        ),

        itemBuilder: (_, index) {
          final room = rooms[index];

          return InkWell(
            borderRadius: BorderRadius.circular(30),

            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.designer,
              );
            },

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:
                  room["colors"] as List<Color>,
                ),

                boxShadow: [
                  BoxShadow(
                    color: (room["colors"] as List<Color>)
                        .first
                        .withOpacity(.35),
                    blurRadius: 30,
                    spreadRadius: 3,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),

              child: Stack(
                children: [

                  //------------------------------------
                  // Glass Highlight
                  //------------------------------------

                  Positioned(
                    top: -40,
                    right: -40,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.12),
                      ),
                    ),
                  ),

                  //------------------------------------
                  // Content
                  //------------------------------------

                  Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Container(
                          width: 60,
                          height: 60,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                            Colors.white.withOpacity(.15),
                          ),

                          child: Icon(
                            room["icon"] as IconData,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          room["title"] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Container(
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color:
                            Colors.white.withOpacity(.18),
                            borderRadius:
                            BorderRadius.circular(20),
                          ),

                          child: const Text(
                            "360° Ready",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Row(
                          children: [

                            Icon(
                              Icons.touch_app,
                              size: 15,
                              color: Colors.white70,
                            ),

                            SizedBox(width: 5),

                            Text(
                              "Tap to Design",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
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