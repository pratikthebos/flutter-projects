import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0B1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Portfolio",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Portfolio Summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff7C3AED),
                    Color(0xffA855F7),
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Total Balance",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "\$124,895.67",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [

                      Icon(
                        Icons.trending_up,
                        color: Colors.greenAccent,
                      ),

                      SizedBox(width: 8),

                      Text(
                        "+5.42% Today",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "My Assets",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const AssetTile(
              icon: Icons.currency_bitcoin,
              color: Colors.orange,
              name: "Bitcoin",
              symbol: "BTC",
              amount: "2.34 BTC",
              value: "\$68,245",
            ),

            AssetTile(
              icon: Icons.currency_exchange,
              color: Colors.blue,
              name: "Ethereum",
              symbol: "ETH",
              amount: "8.21 ETH",
              value: "\$3,450",
            ),

            AssetTile(
              icon: Icons.token,
              color: Colors.purple,
              name: "Solana",
              symbol: "SOL",
              amount: "45.6 SOL",
              value: "\$178",
            ),

            AssetTile(
              icon: Icons.account_balance_wallet,
              color: Colors.amber,
              name: "BNB",
              symbol: "BNB",
              amount: "12.3 BNB",
              value: "\$612",
            ),

            const SizedBox(height: 30),

            const Text(
              "Recent Transactions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const TransactionTile(
              title: "Bought Bitcoin",
              subtitle: "Today • 0.50 BTC",
              isBuy: true,
            ),

            const TransactionTile(
              title: "Sold Ethereum",
              subtitle: "Yesterday • 1.2 ETH",
              isBuy: false,
            ),

            const TransactionTile(
              title: "Bought Solana",
              subtitle: "2 Days Ago • 20 SOL",
              isBuy: true,
            ),

            const TransactionTile(
              title: "Bought BNB",
              subtitle: "Last Week • 4 BNB",
              isBuy: true,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class AssetTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final String symbol;
  final String amount;
  final String value;

  const AssetTile({
    super.key,
    required this.icon,
    required this.color,
    required this.name,
    required this.symbol,
    required this.amount,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff1B1630),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [

          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(.15),
            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                Text(
                  symbol,
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
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                value,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isBuy;

  const TransactionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isBuy,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: CircleAvatar(
        backgroundColor:
        isBuy ? Colors.green.withOpacity(.15) : Colors.red.withOpacity(.15),
        child: Icon(
          isBuy ? Icons.arrow_downward : Icons.arrow_upward,
          color: isBuy ? Colors.green : Colors.red,
        ),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white60),
      ),
      trailing: Text(
        isBuy ? "BUY" : "SELL",
        style: TextStyle(
          color: isBuy ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}