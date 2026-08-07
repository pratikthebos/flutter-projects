import 'package:flutter/material.dart';

class ViewerToolbar extends StatelessWidget {

  const ViewerToolbar({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Align(

          alignment:
          Alignment.bottomCenter,

          child: Container(

            padding:
            const EdgeInsets.symmetric(

              horizontal: 26,

              vertical: 14,

            ),

            decoration: BoxDecoration(

              color: Colors.white
                  .withOpacity(.85),

              borderRadius:
              BorderRadius.circular(30),

              boxShadow: [

                BoxShadow(

                  color: Colors.black
                      .withOpacity(.08),

                  blurRadius: 18,

                )

              ],

            ),

            child: const Row(

              mainAxisSize:
              MainAxisSize.min,

              children: [

                Icon(

                  Icons.swipe,

                  color: Colors.blue,

                ),

                SizedBox(width: 10),

                Text(

                  "Swipe to Explore",

                  style: TextStyle(

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}