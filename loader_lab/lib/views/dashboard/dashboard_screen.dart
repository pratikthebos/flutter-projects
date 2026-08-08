import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_strings.dart';
import '../../core/widgets/animated_background.dart';
import '../../core/widgets/premium_loader_card.dart';
import '../../core/widgets/section_title.dart';

import '../../viewmodels/loader_viewmodel.dart';

import '../../widgets/loader_preview.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoaderViewModel>();

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),

          SafeArea(
            child: CustomScrollView(
              physics:
              const BouncingScrollPhysics(),
              slivers: [
                //------------------------------------------------
                // Header
                //------------------------------------------------

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      22,
                      22,
                      22,
                      10,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(17),
                            gradient:
                            const LinearGradient(
                              colors: [
                                Color(0xff6C63FF),
                                Color(0xff00C6FF),
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.hourglass_top_rounded,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Expanded(
                          child: SectionTitle(
                            title:
                            AppStrings.dashboardTitle,
                            subtitle:
                            AppStrings.dashboardSubtitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //------------------------------------------------
                // Loader cards
                //------------------------------------------------

                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    15,
                    20,
                    40,
                  ),
                  sliver: SliverList(
                    delegate:
                    SliverChildBuilderDelegate(
                          (context, index) {
                        final loader =
                        vm.loaders[index];

                        return Padding(
                          padding:
                          const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: PremiumLoaderCard(
                            loader: loader,
                            preview: LoaderPreview(
                              index: loader.index,
                            ),
                          )
                              .animate()
                              .fadeIn(
                            duration:
                            500.ms,
                          )
                              .slideY(
                            begin: .12,
                            end: 0,
                            duration:
                            500.ms,
                          ),
                        );
                      },
                      childCount:
                      vm.loaders.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}