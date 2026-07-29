import 'package:flutter/material.dart';

import '../models/coin_model.dart';

class DummyDataService {
  static List<CoinModel> coins = [

    CoinModel(
      name: "Bitcoin",
      symbol: "BTC",
      price: "\$68,245",
      change: "+5.42%",
      isUp: true,
      icon: Icons.currency_bitcoin,
      color: Colors.orange,
    ),

    CoinModel(
      name: "Ethereum",
      symbol: "ETH",
      price: "\$3,854",
      change: "-2.15%",
      isUp: false,
      icon: Icons.token,
      color: Colors.blue,
    ),

    CoinModel(
      name: "Solana",
      symbol: "SOL",
      price: "\$174",
      change: "+8.65%",
      isUp: true,
      icon: Icons.bolt,
      color: Colors.purple,
    ),

    CoinModel(
      name: "BNB",
      symbol: "BNB",
      price: "\$612",
      change: "+1.34%",
      isUp: true,
      icon: Icons.currency_exchange,
      color: Colors.amber,
    ),
  ];
}