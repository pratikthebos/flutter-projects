import 'package:flutter/material.dart';

class SparklineChart extends StatelessWidget {

  final bool isUp;

  const SparklineChart({
    super.key,
    required this.isUp,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 90,
      child: CustomPaint(
        painter: SparkPainter(isUp),
      ),
    );

  }
}

class SparkPainter extends CustomPainter {

  final bool isUp;

  SparkPainter(this.isUp);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..color = isUp ? Colors.green : Colors.red;

    final path = Path();

    path.moveTo(0, size.height * .8);

    path.quadraticBezierTo(
      size.width * .25,
      size.height * .6,
      size.width * .4,
      size.height * .65,
    );

    path.quadraticBezierTo(
      size.width * .65,
      isUp ? size.height * .3 : size.height * .9,
      size.width,
      isUp ? size.height * .1 : size.height * .7,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}