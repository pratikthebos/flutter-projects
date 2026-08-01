import 'package:flutter/material.dart';

import '../core/constants/api_steps.dart';
import '../core/constants/app_colors.dart';

class Timeline extends StatefulWidget {
  final int currentStep;
  final int total;

  const Timeline({
    super.key,
    required this.currentStep,
    required this.total,
  });

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final ScrollController controller = ScrollController();

  @override
  void didUpdateWidget(covariant Timeline oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.hasClients) return;

      double offset = 0;

// Show first cards (1-4)
      if (widget.currentStep < 4) {
        offset = 0;
      }
// Show middle cards (5-8)
      else if (widget.currentStep < 8) {
        offset = 300;
      }
// Show last cards (9-12)
      else {
        offset = 650;
      }

// Prevent scrolling beyond the end
      if (offset > controller.position.maxScrollExtent) {
        offset = controller.position.maxScrollExtent;
      }

      controller.animateTo(
        offset,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 3,
        ),
        itemCount: ApiSteps.steps.length,
        itemBuilder: (context, index) {
          final step = ApiSteps.steps[index];

          final completed = index < widget.currentStep;
          final active = index == widget.currentStep;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 400),
              scale: active ? 1.05 : 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,

                width: 120,

                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: completed
                      ? Colors.green.shade50
                      : active
                      ? Colors.blue.shade50
                      : Colors.white,

                  borderRadius: BorderRadius.circular(22),

                  border: Border.all(
                    color: completed
                        ? Colors.green
                        : active
                        ? AppColors.primary
                        : Colors.grey.shade300,
                    width: 2,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: active
                          ? AppColors.primary.withOpacity(.25)
                          : Colors.black12,
                      blurRadius: active ? 18 : 8,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),

                      width: 46,
                      height: 46,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: completed
                            ? Colors.green
                            : active
                            ? AppColors.primary
                            : Colors.grey.shade300,
                      ),

                      child: completed
                          ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                          : Icon(
                        step.icon,
                        color: active
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      step.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: active
                            ? AppColors.primary
                            : Colors.black87,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      step.subtitle,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                      ),
                    ),

                    const SizedBox(height: 8),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),

                      height: 4,

                      width: completed || active ? 60 : 20,

                      decoration: BoxDecoration(
                        color: completed
                            ? Colors.green
                            : active
                            ? AppColors.primary
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}