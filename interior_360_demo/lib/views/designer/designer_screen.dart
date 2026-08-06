import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../core/constants/app_assets.dart';
import '../../viewmodels/designer_viewmodel.dart';

import '../../widgets/panorama_viewer.dart';
import '../../widgets/draggable_furniture.dart';
import '../../widgets/furniture_toolbar.dart';

class DesignerScreen extends StatelessWidget {
  const DesignerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DesignerViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [

          //---------------------------------------------------
          // 360 Panorama Background
          //---------------------------------------------------

          const RoomPanorama(),
          //---------------------------------------------------
          // Dark Overlay
          //---------------------------------------------------

          IgnorePointer(
            child: Container(
              color: Colors.black.withOpacity(0.10),
            ),
          ),

          //---------------------------------------------------
          // Furniture Objects
          //---------------------------------------------------

          ...vm.furniture.map((item) {

            return DraggableFurniture(

              furniture: item,

              selected: vm.selected?.id == item.id,

              onTap: () {

                vm.select(item);

              },

              onMove: (delta) {

                vm.move(item, delta);

              },

              onScale: (value) {

                vm.scale(item, value);

              },

              onRotate: (angle) {

                vm.rotate(item, angle);

              },

            );

          }),

          //---------------------------------------------------
          // Header
          //---------------------------------------------------

          SafeArea(

            child: Padding(

              padding: const EdgeInsets.all(20),

              child: Row(

                children: [

                  CircleAvatar(

                    backgroundColor:
                    Colors.black54,

                    child: IconButton(

                      onPressed: () {

                        Navigator.pop(context);

                      },

                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),

                    ),

                  ),

                  const SizedBox(width: 15),

                  const Expanded(

                    child: Text(

                      "360° Interior Designer",

                      style: TextStyle(

                        color: Colors.white,

                        fontSize: 22,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                  CircleAvatar(

                    backgroundColor:
                    Colors.black54,

                    child: IconButton(

                      onPressed: () {},

                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),

                    ),

                  ),

                ],

              ),

            ),

          ),

          //---------------------------------------------------
          // Delete Button
          //---------------------------------------------------

          if (vm.selected != null)

            Positioned(
              bottom: 15,
              right: 20,
              child: FloatingActionButton.extended(
                heroTag: "delete",
                backgroundColor: Colors.redAccent,
                elevation: 10,
                onPressed: () {
                  vm.delete(vm.selected!);
                },
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

        ],

      ),

      //---------------------------------------------------
      // Bottom Furniture Toolbar
      //---------------------------------------------------

      bottomNavigationBar: FurnitureToolbar(

        onAddSofa: () {

          vm.addSofa();

        },

      ),

    );
  }
}