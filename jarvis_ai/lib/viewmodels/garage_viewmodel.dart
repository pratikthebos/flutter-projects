import 'package:flutter/material.dart';

import '../models/suit_model.dart';

class GarageViewModel extends ChangeNotifier {

  final SuitModel suit = SuitModel.demo();

  String get suitName => suit.name;

  String get owner => suit.owner;

  String get version => suit.version;

  int get health => suit.health;

  int get power => suit.power;

  int get energy => suit.energy;

  int get flight => suit.flight;

}