import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedOutput extends StatefulWidget {
  final String text;

  final bool animate;

  const AnimatedOutput({
    super.key,
    required this.text,
    required this.animate,
  });

  @override
  State<AnimatedOutput> createState() => _AnimatedOutputState();
}

class _AnimatedOutputState extends State<AnimatedOutput> {

  final Random random = Random();

  Timer? timer;

  String display = "";

  final chars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#\$%^&*()";

  @override
  void initState() {
    super.initState();

    if (widget.animate) {
      startAnimation();
    } else {
      display = widget.text;
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedOutput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != oldWidget.text) {
      startAnimation();
    }
  }

  void startAnimation() {

    timer?.cancel();

    display = "";

    int step = 0;

    timer = Timer.periodic(
      const Duration(milliseconds: 35),
          (t) {

        if (step > widget.text.length + 12) {

          t.cancel();

          setState(() {
            display = widget.text;
          });

          return;
        }

        String result = "";

        for (int i = 0; i < widget.text.length; i++) {

          if (i < step) {

            result += widget.text[i];

          } else {

            result += chars[random.nextInt(chars.length)];
          }
        }

        setState(() {
          display = result;
        });

        step++;
      },
    );
  }

  @override
  void dispose() {

    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedSwitcher(

      duration: const Duration(milliseconds: 300),

      child: Text(
        display,

        key: ValueKey(display),

        style: GoogleFonts.jetBrainsMono(
          fontSize: 15,
          color: Colors.white,
          height: 1.6,
        ),
      ),
    );
  }
}