import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _pressed = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 150),
      scale: _pressed ? .96 : 1,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onPressed();
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Container(
              height: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  begin: Alignment(
                    -1 + (_controller.value * 2),
                    -1,
                  ),
                  end: Alignment(
                    1,
                    1,
                  ),
                  colors: const [
                    Color(0xff6366F1),
                    Color(0xff8B5CF6),
                    Color(0xff06B6D4),
                    Color(0xffEC4899),
                    Color(0xff6366F1),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.30),
                    blurRadius: 35,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Stack(
                children: [

                  /// Moving Shine
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Transform.translate(
                        offset: Offset(
                          (_controller.value * 350) - 180,
                          0,
                        ),
                        child: Transform.rotate(
                          angle: -.4,
                          child: Container(
                            width: 70,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.white.withOpacity(.35),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Icon(
                          widget.icon,
                          color: Colors.white,
                        ),

                        const SizedBox(width: 12),

                        Text(
                          widget.text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}