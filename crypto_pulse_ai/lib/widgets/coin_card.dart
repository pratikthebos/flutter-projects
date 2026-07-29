import 'package:flutter/material.dart';

import '../models/coin_model.dart';
import '../views/details/coin_details_screen.dart';
import 'sparkline_chart.dart';

class CoinCard extends StatelessWidget {
  final CoinModel coin;

  const CoinCard({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CoinDetailsScreen(coin: coin),
          ),
        );
      },
      child: Container(
          width: 220,
          height: 280,
          margin: const EdgeInsets.only(right: 18),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xff1B1630),
                coin.color.withOpacity(0.15),
              ],
            ),
            border: Border.all(color: Colors.white10),
            boxShadow: [
              BoxShadow(
                color: coin.color.withOpacity(0.15),
                blurRadius: 18,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Top Row
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: coin.color.withOpacity(0.15),
                    child: Icon(
                      coin.icon,
                      color: coin.color,
                      size: 20,
                    ),
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: coin.isUp
                          ? Colors.green.withOpacity(0.15)
                          : Colors.red.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      coin.change,
                      style: TextStyle(
                        color: coin.isUp ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Text(
                coin.symbol,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                coin.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                ),
              ),

              const Spacer(),

              Center(
                child: SparklineChart(
                  isUp: coin.isUp,
                ),
              ),

              const Spacer(),

              Text(
                coin.price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

    );
  }
}