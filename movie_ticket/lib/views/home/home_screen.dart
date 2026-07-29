import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/movie_banner.dart';
import '../../core/widgets/section_title.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            const CustomAppBar(),

            const SizedBox(height: 25),

            TextField(
              decoration: InputDecoration(
                hintText: "Search Movies...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            MovieBanner(
              image: vm.movies.first.poster,
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Now Showing",
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 670,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.movies.length,
                itemBuilder: (context, index) {

                  return MovieCard(
                    movie: vm.movies[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}