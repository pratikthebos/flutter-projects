import 'package:flutter/material.dart';

class FurnitureModel {

  final String id;

  final String name;

  final String image;

  Offset position;

  double scale;

  double rotation;

  int layer;

  FurnitureModel({

    required this.id,

    required this.name,

    required this.image,

    required this.position,

    this.scale = 1,

    this.rotation = 0,

    this.layer = 0,

  });

  FurnitureModel copyWith({

    String? id,

    String? name,

    String? image,

    Offset? position,

    double? scale,

    double? rotation,

    int? layer,

  }) {

    return FurnitureModel(

      id: id ?? this.id,

      name: name ?? this.name,

      image: image ?? this.image,

      position: position ?? this.position,

      scale: scale ?? this.scale,

      rotation: rotation ?? this.rotation,

      layer: layer ?? this.layer,

    );

  }

}