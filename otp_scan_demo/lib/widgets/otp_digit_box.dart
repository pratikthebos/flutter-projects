import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class OTPDigitBox extends StatelessWidget {
  final String value;
  final bool active;
  final bool success;
  final int index;

  const OTPDigitBox({
    super.key,
    required this.value,
    required this.active,
    required this.success,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool filled = value.isNotEmpty;

    Color borderColor;

    if (success) {
      borderColor = AppTheme.success;
    } else if (active) {
      borderColor = AppTheme.cyan;
    } else if (filled) {
      borderColor = AppTheme.primary;
    } else {
      borderColor = Colors.white.withValues(
        alpha: .12,
      );
    }

    return TweenAnimationBuilder<double>(
      key: ValueKey(
        'otp_box_$index',
      ),
      tween: Tween<double>(
        begin: 0,
        end: filled || success ? 1 : 0,
      ),
      duration: const Duration(
        milliseconds: 280,
      ),
      curve: Curves.easeOutBack,
      builder: (
          context,
          scale,
          child,
          ) {
        return Transform.scale(
          scale: 0.94 + (scale * .06),
          child: Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: success
                  ? AppTheme.success.withValues(
                alpha: .10,
              )
                  : active
                  ? AppTheme.cyan.withValues(
                alpha: .08,
              )
                  : Colors.white.withValues(
                alpha: .035,
              ),
              border: Border.all(
                color: borderColor,
                width: active || success ? 2 : 1,
              ),
              boxShadow: [
                if (active)
                  BoxShadow(
                    color:
                    AppTheme.cyan.withValues(
                      alpha: .25,
                    ),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                if (success)
                  BoxShadow(
                    color:
                    AppTheme.success.withValues(
                      alpha: .25,
                    ),
                    blurRadius: 18,
                    spreadRadius: 2,
                  ),
              ],
            ),
            child: Center(
              child: value.isEmpty
                  ? const Text(
                '•',
                style: TextStyle(
                  color: Colors.white24,
                  fontSize: 16,
                ),
              )
                  : Text(
                value,
                style: TextStyle(
                  color: success
                      ? AppTheme.success
                      : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}