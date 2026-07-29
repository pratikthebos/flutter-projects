import 'package:flutter/material.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/section_title.dart';
import '../../services/dummy_data_service.dart';
import '../../widgets/coin_card.dart';
import '../../widgets/portfolio_card.dart';
import '../../widgets/price_chart.dart';
import '../../widgets/trend_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            /// App Bar
            const CustomAppBar(),

            const SizedBox(height: 28),

            /// Portfolio Card
            const PortfolioCard(),

            const SizedBox(height: 30),

            /// Trending Coins
            const SectionTitle(title: "Trending Coins"),

            const SizedBox(height: 16),

            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DummyDataService.coins.length,
                itemBuilder: (context, index) {
                  return CoinCard(
                    coin: DummyDataService.coins[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            /// Market Overview
            const SectionTitle(title: "Market Overview"),

            const SizedBox(height: 20),

            /// Time Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  TrendChip(
                    text: "1H",
                    selected: true,
                  ),
                  TrendChip(text: "1D"),
                  TrendChip(text: "1W"),
                  TrendChip(text: "1M"),
                  TrendChip(text: "1Y"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Market Chart
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff1B1630),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const PriceChart(),
            ),

            const SizedBox(height: 30),

            /// Watchlist
            const SectionTitle(title: "Watchlist"),

            const SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: DummyDataService.coins.length,
              itemBuilder: (context, index) {
                final coin = DummyDataService.coins[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xff1B1630),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: coin.color.withOpacity(.15),
                        child: Icon(
                          coin.icon,
                          color: coin.color,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coin.name,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              coin.symbol,
                              style: const TextStyle(
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            coin.price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            coin.change,
                            style: TextStyle(
                              color: coin.isUp
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}