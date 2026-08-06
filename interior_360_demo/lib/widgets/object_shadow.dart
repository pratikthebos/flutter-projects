import 'package:flutter/material.dart';

class ObjectShadow extends StatelessWidget {

  final Widget child;

  const ObjectShadow({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(

      alignment: Alignment.center,

      children: [

        Transform.translate(

          offset: const Offset(0,18),

          child: Container(

            width: 120,

            height: 25,

            decoration: BoxDecoration(

              color: Colors.black38,

              borderRadius: BorderRadius.circular(50),

            ),

          ),

        ),

        child,

      ],

    );

  }

}