import 'package:flutter/material.dart';

import '../core/models/furniture_model.dart';
import 'object_shadow.dart';
import 'selection_border.dart';

class DraggableFurniture extends StatefulWidget {
  final FurnitureModel furniture;

  final bool selected;

  final VoidCallback onTap;

  final Function(Offset) onMove;

  final Function(double) onScale;

  final Function(double) onRotate;

  const DraggableFurniture({
    super.key,
    required this.furniture,
    required this.selected,
    required this.onTap,
    required this.onMove,
    required this.onScale,
    required this.onRotate,
  });

  @override
  State<DraggableFurniture> createState() =>
      _DraggableFurnitureState();
}

class _DraggableFurnitureState
    extends State<DraggableFurniture> {

  double _baseScale = 1.0;
  double _baseRotation = 0.0;

  @override
  Widget build(BuildContext context) {

    return Positioned(

      left: widget.furniture.position.dx,

      top: widget.furniture.position.dy,

      child: GestureDetector(

        behavior: HitTestBehavior.translucent,

        onTap: widget.onTap,

        //---------------------------------------
        // Save initial values
        //---------------------------------------

        onScaleStart: (details) {

          _baseScale = widget.furniture.scale;

          _baseRotation = widget.furniture.rotation;

        },

        //---------------------------------------
        // Drag + Scale + Rotate
        //---------------------------------------

        onScaleUpdate: (details) {

          // Move object
          widget.onMove(details.focalPointDelta);

          // Scale object
          widget.onScale(
            (_baseScale * details.scale)
                .clamp(0.4, 3.0),
          );

          // Rotate object
          widget.onRotate(
            _baseRotation + details.rotation,
          );

        },

        child: Transform.rotate(

          angle: widget.furniture.rotation,

          child: Transform.scale(

            scale: widget.furniture.scale,

            child: SelectionBorder(

              selected: widget.selected,

              child: ObjectShadow(

                child: Image.asset(

                  widget.furniture.image,

                  width: 180,

                  fit: BoxFit.contain,

                ),

              ),

            ),

          ),

        ),

      ),

    );

  }

}