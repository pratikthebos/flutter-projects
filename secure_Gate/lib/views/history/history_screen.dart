import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/animated_background.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/status_chip.dart';
import '../../viewmodels/history_viewmodel.dart';
import '../../widgets/history_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HistoryViewModel>(context);

    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [

              const CustomAppBar(),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Gate Activity",
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: "Search Visitor",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: vm.filters.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final filter = vm.filters[index];

                    return GestureDetector(
                      onTap: () {
                        vm.changeFilter(filter);
                      },
                      child: StatusChip(
                        text: filter,
                        color: vm.selectedFilter == filter
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              ...vm.history.map(
                    (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: HistoryTile(
                    item: item,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}