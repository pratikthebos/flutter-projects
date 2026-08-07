import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/viewer_viewmodel.dart';

import '../../widgets/panorama_widget.dart';
import '../../widgets/floating_info.dart';
import '../../widgets/viewer_toolbar.dart';

class ViewerScreen extends StatelessWidget {
  const ViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ViewerViewModel>();

    final place = vm.selectedPlace;

    if (place == null) {
      return const Scaffold(
        body: Center(
          child: Text("No Place Selected"),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [

          //------------------------------------------------
          // 360 Panorama
          //------------------------------------------------

          Hero(
            tag: place.image,
            child: PanoramaWidget(
              image: place.image,
            ),
          ),

          //------------------------------------------------
          // Dark Overlay
          //------------------------------------------------

          IgnorePointer(
            child: Container(
              color: Colors.black.withOpacity(.15),
            ),
          ),

          //------------------------------------------------
          // Back Button
          //------------------------------------------------

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor:
                  Colors.white.withOpacity(.85),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),

          //------------------------------------------------
          // Floating Info
          //------------------------------------------------

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 230,
                  child: FloatingInfo(
                    title: place.title,
                    subtitle: place.description,
                  ),
                ),
              ),
            ),
          ),

          //------------------------------------------------
          // Bottom Toolbar
          //------------------------------------------------

          const ViewerToolbar(),
        ],
      ),
    );
  }
}