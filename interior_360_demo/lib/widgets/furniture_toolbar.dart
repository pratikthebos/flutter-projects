import 'package:flutter/material.dart';

class FurnitureToolbar extends StatelessWidget {
  final VoidCallback onAddSofa;

  const FurnitureToolbar({
    super.key,
    required this.onAddSofa,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": Icons.weekend, "title": "Sofa"},
      {"icon": Icons.chair, "title": "Chair"},
      {"icon": Icons.table_restaurant, "title": "Table"},
      {"icon": Icons.bed, "title": "Bed"},
      {"icon": Icons.tv, "title": "TV"},
      {"icon": Icons.light, "title": "Lamp"},
      {"icon": Icons.local_florist, "title": "Plant"},
      {"icon": Icons.shelves, "title": "Shelf"},
      {"icon": Icons.kitchen, "title": "Kitchen"},
      {"icon": Icons.coffee, "title": "Coffee"},
      {"icon": Icons.bathtub, "title": "Bath"},
      {"icon": Icons.desk, "title": "Desk"},
      {"icon": Icons.book, "title": "Books"},
      {"icon": Icons.crop_portrait, "title": "Mirror"},
      {"icon": Icons.wallpaper, "title": "Frame"},
      {"icon": Icons.access_time, "title": "Clock"},
    ];

    return Container(
      height: 135,
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        border: Border.all(
          color: Colors.white12,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.35),
            blurRadius: 25,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),

          Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.chair_alt,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  "Furniture Catalog",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return _item(
                  item["icon"] as IconData,
                  item["title"] as String,
                  onAddSofa,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          width: 82,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(.14),
                Colors.white.withOpacity(.05),
              ],
            ),
            border: Border.all(
              color: Colors.white12,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.cyan.withOpacity(.15),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}