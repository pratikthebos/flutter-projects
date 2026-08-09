import 'package:flutter/material.dart';

class NeonControlsDemo extends StatefulWidget {
  const NeonControlsDemo({
    super.key,
  });

  @override
  State<NeonControlsDemo> createState() =>
      _NeonControlsDemoState();
}

class _NeonControlsDemoState
    extends State<NeonControlsDemo> {
  double value = .65;
  bool active = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330,
        padding:
        const EdgeInsets.all(28),
        decoration:
        BoxDecoration(
          borderRadius:
          BorderRadius.circular(35),
          color:
          const Color(
            0xff111827,
          ),
          boxShadow: [
            BoxShadow(
              color:
              const Color(
                0xff6C63FF,
              ).withValues(
                alpha: .20,
              ),
              blurRadius: 40,
            ),
          ],
        ),
        child: Column(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            const Icon(
              Icons.tune_rounded,
              color:
              Color(
                0xff00C6FF,
              ),
              size: 45,
            ),

            const SizedBox(
              height: 15,
            ),

            const Text(
              'NEON CONTROL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight:
                FontWeight.w800,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(
              height: 35,
            ),

            Slider(
              value: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
              activeColor:
              const Color(
                0xff00C6FF,
              ),
              inactiveColor:
              Colors.white12,
            ),

            const SizedBox(
              height: 20,
            ),

            Switch(
              value: active,
              onChanged: (v) {
                setState(() {
                  active = v;
                });
              },
              activeColor:
              const Color(
                0xff6C63FF,
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Text(
              '${(value * 100).round()}%',
              style:
              const TextStyle(
                color:
                Color(
                  0xff00C6FF,
                ),
                fontSize: 30,
                fontWeight:
                FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}