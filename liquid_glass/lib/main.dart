import 'package:flutter/material.dart';
import 'package:liquid_glass/widgets/%20glass_horizontal_card.dart';

import 'widgets/animated_background.dart';
import 'widgets/glass_bottom_nav.dart';
import 'widgets/glass_button.dart';
import 'widgets/glass_card.dart';

import 'widgets/glass_stat_card.dart';

void main() {
  runApp(const LiquidGlassApp());
}

class LiquidGlassApp extends StatelessWidget {
  const LiquidGlassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Liquid Glass UI",
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,

      body: Stack(
        children: [

          //------------------------------------------
          // Animated Background
          //------------------------------------------

          const AnimatedBackground(),

          //------------------------------------------
          // Content
          //------------------------------------------

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  //------------------------------------------------
                  // Header
                  //------------------------------------------------

                  const Text(
                    "Liquid Glass",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Premium Flutter UI",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  //------------------------------------------------
                  // Big Card
                  //------------------------------------------------

                  const GlassCard(
                    title: "Wallet",
                    subtitle: "Total Balance\n\$18,245.00",
                    icon: Icons.account_balance_wallet,
                    gradient: [
                      Color(0xff4F46E5),
                      Color(0xff7C3AED),
                    ],
                  ),

                  const SizedBox(height: 28),

                  //------------------------------------------------
                  // Horizontal Cards
                  //------------------------------------------------

                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GlassHorizontalCard(
                          title: "Wallet",
                          subtitle: "\$18,240",
                          icon: Icons.account_balance_wallet,
                          gradient: const [
                            Color(0xff4F46E5),
                            Color(0xff7C3AED),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Fitness",
                          subtitle: "8,450 Steps",
                          icon: Icons.fitness_center,
                          gradient: const [
                            Color(0xff06B6D4),
                            Color(0xff3B82F6),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Music",
                          subtitle: "24 Albums",
                          icon: Icons.music_note,
                          gradient: const [
                            Color(0xffEC4899),
                            Color(0xffF43F5E),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Analytics",
                          subtitle: "95% Growth",
                          icon: Icons.analytics_rounded,
                          gradient: const [
                            Color(0xff10B981),
                            Color(0xff34D399),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Travel",
                          subtitle: "12 Trips",
                          icon: Icons.flight_takeoff_rounded,
                          gradient: const [
                            Color(0xffF97316),
                            Color(0xffFB923C),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Health",
                          subtitle: "Heart 78 BPM",
                          icon: Icons.favorite_rounded,
                          gradient: const [
                            Color(0xffEF4444),
                            Color(0xffF87171),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Shopping",
                          subtitle: "128 Orders",
                          icon: Icons.shopping_bag_rounded,
                          gradient: const [
                            Color(0xff8B5CF6),
                            Color(0xffA78BFA),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Finance",
                          subtitle: "₹1.25L Saved",
                          icon: Icons.savings_rounded,
                          gradient: const [
                            Color(0xff14B8A6),
                            Color(0xff2DD4BF),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Messages",
                          subtitle: "28 Unread",
                          icon: Icons.chat_bubble_rounded,
                          gradient: const [
                            Color(0xff0EA5E9),
                            Color(0xff38BDF8),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Weather",
                          subtitle: "26°C Sunny",
                          icon: Icons.wb_sunny_rounded,
                          gradient: const [
                            Color(0xffF59E0B),
                            Color(0xffFCD34D),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "Photos",
                          subtitle: "2,540 Images",
                          icon: Icons.photo_library_rounded,
                          gradient: const [
                            Color(0xff6366F1),
                            Color(0xff818CF8),
                          ],
                        ),

                        GlassHorizontalCard(
                          title: "AI Assistant",
                          subtitle: "Online",
                          icon: Icons.auto_awesome_rounded,
                          gradient: const [
                            Color(0xff22C55E),
                            Color(0xff4ADE80),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  //------------------------------------------------
                  // Statistics
                  //------------------------------------------------

                  Row(
                    children: const [

                      GlassStatCard(
                        title: "Revenue",
                        value: "\$24K",
                        icon: Icons.trending_up,
                        gradient: [
                          Color(0xff6366F1),
                          Color(0xff8B5CF6),
                        ],
                      ),

                      SizedBox(width: 18),

                      GlassStatCard(
                        title: "Users",
                        value: "18K",
                        icon: Icons.people,
                        gradient: [
                          Color(0xff06B6D4),
                          Color(0xff3B82F6),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: const [

                      GlassStatCard(
                        title: "Orders",
                        value: "245",
                        icon: Icons.shopping_bag,
                        gradient: [
                          Color(0xffF97316),
                          Color(0xffFB923C),
                        ],
                      ),

                      SizedBox(width: 18),

                      GlassStatCard(
                        title: "Rating",
                        value: "4.9",
                        icon: Icons.star,
                        gradient: [
                          Color(0xffFACC15),
                          Color(0xffEAB308),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  Row(
                    children: const [

                      GlassStatCard(
                        title: "Downloads",
                        value: "12.5K",
                        icon: Icons.download_rounded,
                        gradient: [
                          Color(0xff14B8A6),
                          Color(0xff2DD4BF),
                        ],
                      ),

                      SizedBox(width: 18),

                      GlassStatCard(
                        title: "Messages",
                        value: "1.2K",
                        icon: Icons.chat_bubble_rounded,
                        gradient: [
                          Color(0xffEC4899),
                          Color(0xffF472B6),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  Row(
                    children: const [

                      GlassStatCard(
                        title: "Followers",
                        value: "25K",
                        icon: Icons.group_rounded,
                        gradient: [
                          Color(0xff3B82F6),
                          Color(0xff60A5FA),
                        ],
                      ),

                      SizedBox(width: 18),

                      GlassStatCard(
                        title: "Achievements",
                        value: "128",
                        icon: Icons.emoji_events_rounded,
                        gradient: [
                          Color(0xffF59E0B),
                          Color(0xffFCD34D),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  //------------------------------------------------
                  // Button
                  //------------------------------------------------

                  GlassButton(
                    text: "Continue",
                    icon: Icons.arrow_forward,

                    gradient: const [
                      Color(0xff4F46E5),
                      Color(0xff7C3AED),
                    ],

                    onTap: () {},
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),

      //----------------------------------------------------------
      // Bottom Navigation
      //----------------------------------------------------------

      bottomNavigationBar: GlassBottomNav(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}