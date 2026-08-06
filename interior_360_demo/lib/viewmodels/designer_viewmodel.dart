import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../core/constants/app_assets.dart';
import '../core/models/furniture_model.dart';

class DesignerViewModel extends ChangeNotifier {

  final uuid = const Uuid();

  final List<FurnitureModel> furniture = [];

  FurnitureModel? selected;

  //---------------------------------------
  // Add Furniture
  //---------------------------------------

  void addSofa() {

    final item = FurnitureModel(

      id: uuid.v4(),

      name: "Sofa",

      image: AppAssets.sofa,

      position: const Offset(180, 300),

    );

    furniture.add(item);

    selected = item;

    notifyListeners();

  }

  //---------------------------------------
  // Select
  //---------------------------------------

  void select(FurnitureModel item) {

    selected = item;

    notifyListeners();

  }

  //---------------------------------------
  // Move
  //---------------------------------------

  void move(FurnitureModel item, Offset delta) {

    item.position += delta;

    notifyListeners();

  }

  //---------------------------------------
  // Scale
  //---------------------------------------

  void scale(FurnitureModel item, double value) {

    item.scale = value;

    notifyListeners();

  }

  //---------------------------------------
  // Rotate
  //---------------------------------------

  void rotate(FurnitureModel item, double angle) {

    item.rotation = angle;

    notifyListeners();

  }

  //---------------------------------------
  // Delete
  //---------------------------------------

  void delete(FurnitureModel item) {

    furniture.remove(item);

    selected = null;

    notifyListeners();

  }

}