import 'package:crypto_pulse_ai/widgets/volume_chart.dart';
import 'package:flutter/material.dart';

import '../../models/coin_model.dart';
import '../../widgets/price_chart.dart';
import '../../widgets/trend_chip.dart';

class CoinDetailsScreen extends StatelessWidget {
  final CoinModel coin;

  const CoinDetailsScreen({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0B1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(coin.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Coin Info
            Row(
              children: [

                Hero(
                  tag: coin.symbol,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: coin.color.withOpacity(.15),
                    child: Icon(
                      coin.icon,
                      color: coin.color,
                      size: 32,
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      coin.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      coin.symbol,
                      style: const TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// Price
            Text(
              coin.price,
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              coin.change,
              style: TextStyle(
                color: coin.isUp ? Colors.green : Colors.red,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            /// Time Filters
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

            const SizedBox(height: 25),

            /// Chart
            /// Price Chart
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff1B1630),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const PriceChart(),

                  const SizedBox(height: 20),

                  const Text(
                    "Volume",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const VolumeChart(),

                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Market Statistics",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5,
              children: const [

                _StatCard(
                  title: "Market Cap",
                  value: "\$1.35T",
                ),

                _StatCard(
                  title: "Volume",
                  value: "\$54B",
                ),

                _StatCard(
                  title: "Supply",
                  value: "19.7M",
                ),

                _StatCard(
                  title: "24H High",
                  value: "\$69,250",
                ),

              ],
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "BUY",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "SELL",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff1B1630),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}